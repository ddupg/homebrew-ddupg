class Artix < Formula
  desc "Developer workspace disk cleanup TUI with Git/worktree awareness"
  homepage "https://github.com/ddupg/artix"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.2.0/artix-x86_64-apple-darwin.tar.gz"
      sha256 "5e8640a2152ed3e5126cc9108b5be3408ebc1644e639ce6e5885ab91a46aaf73"
    end
    on_arm do
      url "https://github.com/ddupg/artix/releases/download/v0.2.0/artix-aarch64-apple-darwin.tar.gz"
      sha256 "b3c75ed3bbc508d33ae0338c3d47c620a7fb7ff4d7b8f0bf03dc1df68789faa6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.2.0/artix-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "608b5e58a7572eb0f89a9c837773d996aa72159cd8e26ac87870f00316593d75"
    end
  end

  def install
    bin.install "artix"
  end

  test do
    assert_match "developer workspace cleanup TUI", shell_output("#{bin}/artix --help")
  end
end
