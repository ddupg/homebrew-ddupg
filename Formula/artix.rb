class Artix < Formula
  desc "Developer workspace disk cleanup TUI with Git/worktree awareness"
  homepage "https://github.com/ddupg/artix"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.1.1/artix-x86_64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
    on_arm do
      url "https://github.com/ddupg/artix/releases/download/v0.1.1/artix-aarch64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    url "https://github.com/ddupg/artix/releases/download/v0.1.1/artix-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    bin.install "artix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/artix --version", 2)
  end
end
