# frozen_string_literal: true

require "optparse"

ASSETS = {
  "x86_64-apple-darwin" => "artix-x86_64-apple-darwin.tar.gz",
  "aarch64-apple-darwin" => "artix-aarch64-apple-darwin.tar.gz",
  "x86_64-unknown-linux-gnu" => "artix-x86_64-unknown-linux-gnu.tar.gz"
}.freeze

options = {
  formula: "Formula/artix.rb",
  shas: {},
  dry_run: false
}

parser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby scripts/update_artix_formula.rb --tag v0.2.0 --sha target=sha256 [...]"

  opts.on("--formula PATH", "Formula path") do |value|
    options[:formula] = value
  end

  opts.on("--tag TAG", "Release tag, e.g. v0.2.0") do |value|
    options[:tag] = value
  end

  opts.on("--sha TARGET=SHA256", "Checksum for a supported target") do |value|
    target, sha = value.split("=", 2)
    raise OptionParser::InvalidArgument, "--sha must use TARGET=SHA256" if target.nil? || sha.nil?

    options[:shas][target] = sha
  end

  opts.on("--dry-run", "Print updated formula to stdout instead of writing it") do
    options[:dry_run] = true
  end
end

parser.parse!

tag = options[:tag]
raise OptionParser::MissingArgument, "--tag is required" if tag.nil? || tag.empty?
raise ArgumentError, "tag must start with v" unless tag.start_with?("v")

missing_targets = ASSETS.keys - options[:shas].keys
raise ArgumentError, "missing sha for #{missing_targets.join(", ")}" unless missing_targets.empty?

unknown_targets = options[:shas].keys - ASSETS.keys
raise ArgumentError, "unknown sha target #{unknown_targets.join(", ")}" unless unknown_targets.empty?

options[:shas].each do |target, sha|
  unless sha.match?(/\A[0-9a-f]{64}\z/)
    raise ArgumentError, "invalid sha256 for #{target}: #{sha}"
  end
end

formula_path = options[:formula]
content = File.read(formula_path)

ASSETS.each do |target, archive|
  sha = options[:shas].fetch(target)
  pattern = %r{(url "https://github\.com/ddupg/artix/releases/download/)[^/]+(/#{Regexp.escape(archive)}"\n\s*sha256 ")[0-9a-f]{64}(")}
  matches = content.scan(pattern)

  if matches.length != 1
    raise "expected exactly one URL/sha256 block for #{archive}, found #{matches.length}"
  end

  content = content.gsub(pattern) do
    "#{Regexp.last_match(1)}#{tag}#{Regexp.last_match(2)}#{sha}#{Regexp.last_match(3)}"
  end
end

if options[:dry_run]
  print content
else
  File.write(formula_path, content)
end
