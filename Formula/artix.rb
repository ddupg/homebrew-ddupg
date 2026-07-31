class Artix < Formula
  desc "Developer workspace disk cleanup TUI with Git/worktree awareness"
  homepage "https://github.com/ddupg/artix"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.3.2/artix-x86_64-apple-darwin.tar.gz"
      sha256 "1c35a42222401ecab8585bc3002dd1d6a6eef9b07f051d5c10944767a3359153"
    end
    on_arm do
      url "https://github.com/ddupg/artix/releases/download/v0.3.2/artix-aarch64-apple-darwin.tar.gz"
      sha256 "cf0946d8cc967dc837982c109c15a5ce4efb0381d7720da533501320fad01ae2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.3.2/artix-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17ae6a1b76642f074280b95e7227a9c4331019b24ad1960344d41524be27eb4e"
    end
  end

  def install
    bin.install "artix"
  end

  test do
    assert_match "developer workspace cleanup TUI", shell_output("#{bin}/artix --help")
  end
end
