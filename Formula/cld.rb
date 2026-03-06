class Cld < Formula
  desc "Claude Code workspace launcher — tmux sessions with git worktree support"
  homepage "https://github.com/ivo9999/homebrew-cld"
  url "https://github.com/ivo9999/homebrew-cld/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fd04c3a1df2925092df67da4d0883aa50638229f253c2f2c3c9fc065481fb077"
  license "MIT"

  depends_on "tmux"

  def install
    bin.install "cld"
    zsh_completion.install "completions/_cld"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cld help")
  end
end
