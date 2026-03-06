# cld — Claude Code Workspace Launcher

A CLI tool that launches [Claude Code](https://claude.ai/claude-code) in organized tmux workspaces with git worktree support.

## Features

- **Tmux workspaces** — Opens Claude Code in a split-pane tmux layout (65/35)
- **Git worktrees** — Isolate branches in separate directories and sessions
- **Session management** — List, attach, kill, and clean up sessions
- **Zsh completions** — Tab-complete subcommands, session names, branches, and paths
- **Auto-update** — Runs `brew upgrade claude-code` before each launch

## Install

```bash
brew install ivo9999/cld/cld
```

### Dependencies

- [tmux](https://github.com/tmux/tmux) — `brew install tmux`
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — `brew install claude-code`
- git

## Usage

```
cld [repo-path] [branch] [session-name]   Open a project (default: current dir)
cld help                                   Show help
cld ls                                     List active sessions
cld status                                 Show detailed session info
cld kill <session>                         Kill a specific session
cld attach <session>                       Attach to a session (partial match)
cld clean [repo-path] [--all]              Remove worktrees + sessions
```

## Examples

```bash
# Launch in current directory
cld

# Open a project
cld ~/projects/myapp

# Create a worktree for a branch and launch
cld ~/projects/myapp feature/auth

# Custom session name
cld ~/projects/myapp feature/auth myapp-auth

# Session management
cld ls                          # List sessions
cld status                      # Detailed info (panes, directory, claude running?)
cld attach myapp                # Attach by partial name match
cld kill myapp-auth             # Kill a session

# Cleanup worktrees
cld clean ~/projects/myapp      # Interactive picker
cld clean ~/projects/myapp --all  # Remove all worktrees
```

## Layout

```
┌────────────────────┬──────────┐
│                    │ Terminal │
│    Claude Code     │──────────│
│      (65%)         │ Terminal │
│                    │  (35%)   │
└────────────────────┴──────────┘
```

## Tmux Settings (per session)

- Mouse support enabled
- Vi copy-mode keys
- 50,000 line scrollback buffer
- Labeled pane borders
- Window auto-rename disabled
