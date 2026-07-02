class Artix < Formula
  desc "Developer workspace disk cleanup TUI with Git/worktree awareness"
  homepage "https://github.com/ddupg/artix"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.3.0/artix-x86_64-apple-darwin.tar.gz"
      sha256 "c5cbd58ed2f55752c00b1f37462fe85965ec4cb88da6d14d3cf55e7b607e2996"
    end
    on_arm do
      url "https://github.com/ddupg/artix/releases/download/v0.3.0/artix-aarch64-apple-darwin.tar.gz"
      sha256 "6ab296b8570b5bd4e73e4bee1d839ded60be1618a40bbb07fe72cfcba079dac8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ddupg/artix/releases/download/v0.3.0/artix-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70438e1c92287f28b68a63b37d00be800bb7142fc10321bd6b8f843587376928"
    end
  end

  def install
    bin.install "artix"
  end

  test do
    assert_match "developer workspace cleanup TUI", shell_output("#{bin}/artix --help")
  end
end
