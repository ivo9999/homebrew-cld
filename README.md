# cld

Claude Code workspace launcher. Opens [Claude Code](https://docs.anthropic.com/en/docs/claude-code) in organized tmux sessions with git worktree support.

```
┌────────────────────┬──────────┐
│                    │ Terminal │
│    Claude Code     │──────────│
│      (65%)         │ Terminal │
│                    │  (35%)   │
└────────────────────┴──────────┘
```

## Install

**Homebrew:**

```bash
brew install ivo9999/cld/cld
```

**Or with curl:**

```bash
curl -fsSL https://raw.githubusercontent.com/ivo9999/homebrew-cld/main/install.sh | bash
```

### Requirements

- [tmux](https://github.com/tmux/tmux) — `brew install tmux`
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — `brew install claude-code`
- git

## Usage

```
cld [repo-path] [branch] [session-name]   Open a project (default: current dir)
cld help                                   Show help
cld ls                                     List active sessions
cld status                                 Detailed session info
cld kill <session>                         Kill a session
cld attach <session>                       Attach by partial name match
cld clean [repo-path] [--all]              Remove worktrees + sessions
```

## Examples

```bash
cld                                        # Launch in current directory
cld ~/projects/myapp                       # Open a project
cld ~/projects/myapp feature/auth          # Create worktree + launch
cld ~/projects/myapp feature/auth my-auth  # Custom session name
```

```bash
cld ls                                     # List sessions
cld status                                 # Pane count, directory, claude running?
cld attach myapp                           # Attach by partial match
cld kill my-auth                           # Kill a session
```

```bash
cld clean ~/projects/myapp                 # Interactive worktree cleanup
cld clean ~/projects/myapp --all           # Remove all worktrees
```

## What it does

1. Updates Claude Code (`brew upgrade claude-code`)
2. Creates a tmux session named after your project
3. Splits into 3 panes: Claude Code (65%) + two terminals (35%)
4. Launches `claude` in the main pane

When a branch is specified, it creates a [git worktree](https://git-scm.com/docs/git-worktree) so each branch gets its own directory and tmux session.

## Session settings

Each session is configured with:

- **Mouse support** — resize panes, scroll, click
- **Vi copy-mode** — navigate and yank Claude's output
- **50k scrollback** — never lose output
- **Labeled panes** — bordered with "claude" / "term" labels
- **Locked window name** — won't get overwritten by running commands

## Zsh completions

Installed automatically with both Homebrew and the curl installer. Completes subcommands, session names, repo paths, git branches, and flags.

## License

[MIT](LICENSE)
