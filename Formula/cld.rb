class Cld < Formula
  desc "Claude Code workspace launcher — tmux sessions with git worktree support"
  homepage "https://github.com/ivo9999/cld"
  url "https://github.com/ivo9999/cld/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "472880529362fa3743516fc223e21e8f28e6cb7452e924cb7753b21653afde96"
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
