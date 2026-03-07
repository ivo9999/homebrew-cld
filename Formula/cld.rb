class Cld < Formula
  desc "Claude Code workspace launcher — tmux sessions with git worktree support"
  homepage "https://github.com/ivo9999/homebrew-cld"
  url "https://github.com/ivo9999/homebrew-cld/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "30ad21f62a297142a5ee546fed8e412e79cdbf0969a09cc24b563fd1af1c3fee"
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
