class Cld < Formula
  desc "Claude Code workspace launcher — tmux sessions with git worktree support"
  homepage "https://github.com/ivo9999/homebrew-cld"
  url "https://github.com/ivo9999/homebrew-cld/archive/refs/tags/v0.2.10.tar.gz"
  sha256 "3082d2e9b66e79547ce7275e337475cc49bcf22c56101d71c82fbe64bddd20e9"
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
