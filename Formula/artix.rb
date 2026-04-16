class Artix < Formula
  desc "Developer workspace disk cleanup TUI with Git/worktree awareness"
  homepage "https://github.com/ddupg/artix"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.1.1/artix-x86_64-apple-darwin.tar.gz"
      sha256 "e22bfb044e7c850cbd789f20f2a74d6a7392e4e27daf1828f987cb6f6f492fb9"
    end
    on_arm do
      url "https://github.com/ddupg/artix/releases/download/v0.1.1/artix-aarch64-apple-darwin.tar.gz"
      sha256 "e5f5276ca3f0a20156ad8bc7c4fe432f45afb59c443e7db10183459e3e9feacc"
    end
  end

  on_linux do
    url "https://github.com/ddupg/artix/releases/download/v0.1.1/artix-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5d5f5da151fd0411ce571a719e2ffe1b5583a75367219470b9cf189dc1dd8d41"
  end

  def install
    bin.install "artix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/artix --version", 2)
  end
end
