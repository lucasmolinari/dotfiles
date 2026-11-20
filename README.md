# Dotfiles

Dotfiles use [GNU Stow](https://www.gnu.org/software/stow/). Each named top-level directory is a package; its contents mirror `$HOME`.

```
stow terminal
stow .                         # stow every package
```

`.stow-local-ignore` excludes repository metadata and non-home files.

| Package | Target paths |
|---|---|
| `agents` | `~/.agents`, `~/.claude`, `~/.codex`, `~/.config/opencode`, `~/.openclaude` |
| `desktop` | `~/.config/{dunst,i3,i3blocks,rofi,sway,swaylock,waybar}` |
| `editors` | `~/.emacs.d`, `~/.config/{nvim,zed}` |
| `git` | `~/.gitconfig` |
| `terminal` | `~/.tmux.conf`, `~/.zshrc`, `~/.config/{foot,kitty,starship.toml}` |

## Agent configuration

Edit one canonical rules file. All agents read it through symlinks:

```
dotfiles/agents/.agents/global/AGENTS.md       ← real file
  ├── agents/.config/opencode/AGENTS.md        (symlink → ../../.agents/global/AGENTS.md)
  ├── agents/.claude/CLAUDE.md                 (symlink → ../.agents/global/AGENTS.md)
  ├── agents/.openclaude/CLAUDE.md             (symlink → ../.agents/global/AGENTS.md)
  └── agents/.codex/AGENTS.md                  (symlink → ../.agents/global/AGENTS.md)
```

### Installing external skills

```
npx skills add vercel-labs/skills
npx skills sync
```

### Fresh machine setup

```
cd ~/dotfiles
stow .
(cd agents/.config/opencode && npm install)
npx skills sync
```

### Notes

- Cursor MCP config (`~/.cursor/mcp.json`) is not stowed because it contains API keys.
- `agents/.config/opencode/node_modules/` is gitignored.
