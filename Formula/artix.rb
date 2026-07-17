class Artix < Formula
  desc "Developer workspace disk cleanup TUI with Git/worktree awareness"
  homepage "https://github.com/ddupg/artix"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.3.1/artix-x86_64-apple-darwin.tar.gz"
      sha256 "7c982e2198f1f7e432a82ebbb030658fbfd4ddd9facb99ee2d5dfbed0f4ead40"
    end
    on_arm do
      url "https://github.com/ddupg/artix/releases/download/v0.3.1/artix-aarch64-apple-darwin.tar.gz"
      sha256 "3d7cb1db2e5e29077b13e1e212e049aa28b9a7ee22a2b1496e4e4e7a93de74a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.3.1/artix-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9388212188e8df25a388cf6b5c80191de18f2d1882dfbb5e404f3ec58cd305be"
    end
  end

  def install
    bin.install "artix"
  end

  test do
    assert_match "developer workspace cleanup TUI", shell_output("#{bin}/artix --help")
  end
end
