class Cld < Formula
  desc "Claude Code workspace launcher — tmux sessions with git worktree support"
  homepage "https://github.com/ivo9999/homebrew-cld"
  url "https://github.com/ivo9999/homebrew-cld/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "4d96aa3c0a995568ad8efc7d57e882c4ac074b5846c199e83c9d1c5b6720de54"
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
