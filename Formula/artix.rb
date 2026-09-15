class Artix < Formula
  desc "Developer workspace disk cleanup TUI with Git/worktree awareness"
  homepage "https://github.com/ddupg/artix"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.3.3/artix-x86_64-apple-darwin.tar.gz"
      sha256 "2e65553c73b0cd1d33a0df38e208d6420d100241dc8396b0e3fc9471b3aef356"
    end
    on_arm do
      url "https://github.com/ddupg/artix/releases/download/v0.3.3/artix-aarch64-apple-darwin.tar.gz"
      sha256 "3d539028243cca20532149d4187eedc638068f39329113d231be7e7614448329"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.3.3/artix-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d455d30cbb9191bf5c171410b6bc3f88fd5632a62eb136e3ca8bff63f4e16b7"
    end
  end

  def install
    bin.install "artix"
  end

  test do
    assert_match "developer workspace cleanup TUI", shell_output("#{bin}/artix --help")
  end
end
