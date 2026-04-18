class Artix < Formula
  desc "Developer workspace disk cleanup TUI with Git/worktree awareness"
  homepage "https://github.com/ddupg/artix"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.1.2/artix-x86_64-apple-darwin.tar.gz"
      sha256 "dacd1826483c85acc10ca444fee91a8528309d32ba587ab91b2ed1d99a2de1e7"
    end
    on_arm do
      url "https://github.com/ddupg/artix/releases/download/v0.1.2/artix-aarch64-apple-darwin.tar.gz"
      sha256 "5949b94026791c009c7c3be5c074967375f8aa1e90feb706cd789ee9572d72c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.1.2/artix-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da7a952df0780d58c5a81f29d4f79471ea53421916a5e082b0370772c49f1234"
    end
  end

  def install
    bin.install "artix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/artix --version", 2)
  end
end
