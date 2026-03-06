class Cld < Formula
  desc "Claude Code workspace launcher — tmux sessions with git worktree support"
  homepage "https://github.com/ivo9999/homebrew-cld"
  url "https://github.com/ivo9999/homebrew-cld/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "bc29d37cb86f38c9f0beefc94b6352dc85844e708cf3212fe7f478f04c0520a3"
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
