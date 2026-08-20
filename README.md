# Dotfiles

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Stow creates *symlinks* in `$HOME` from the directory structure inside each package. Top-level dirs are packages; internal paths mirror their target in `$HOME`.

```
stow .config/nvim       # ~/.config/nvim -> ~/dotfiles/.config/nvim
stow .                  # symlink all packages
```

Use `.stow-local-ignore` to exclude paths.

## Agent configuration

### Architecture

Edit one canonical rules file — all agents read it via a symlink chain:

```
dotfiles/.agents/global/AGENTS.md        ← real file
  ├── .config/opencode/AGENTS.md         (symlink → ../../.agents/global/AGENTS.md)
  ├── .claude/CLAUDE.md                  (symlink → ../.agents/global/AGENTS.md)
  ├── .openclaude/CLAUDE.md              (symlink → ../.agents/global/AGENTS.md)
  └── .codex/AGENTS.md                   (symlink → ../.agents/global/AGENTS.md)
```

### Directory layout

| Path | Type | Managed by |
|---|---|---|
| `dotfiles/.agents/global/AGENTS.md` | Real file — canonical rules | Git |
| `dotfiles/.config/opencode/AGENTS.md` | Symlink → `../../.agents/global/AGENTS.md` | Git |
| `dotfiles/.claude/CLAUDE.md` | Symlink → `../.agents/global/AGENTS.md` | Git |
| `dotfiles/.openclaude/CLAUDE.md` | Symlink → `../.agents/global/AGENTS.md` | Git |
| `dotfiles/.codex/AGENTS.md` | Symlink → `../.agents/global/AGENTS.md` | Git |
| `dotfiles/.config/opencode/` | Agent config, plugins, commands | Git + stow |
| `dotfiles/.claude/settings.json` | Claude settings | Git + stow |
| `dotfiles/.openclaude/settings.json` | OpenClaude settings | Git + stow |
| `dotfiles/.codex/config.toml` | Codex settings | Git + stow |

### Editing global rules

Edit `dotfiles/.agents/global/AGENTS.md`. All four agents read it through the chain. No copies, no syncing.

### Installing external skills

```
npx skills add vercel-labs/skills
npx skills sync
```

### Fresh machine setup

```
cd ~/dotfiles
stow .                                    # create all symlinks
(cd ~/.config/opencode && npm install)    # opencode plugin deps
npx skills sync                           # reinstall external skills
```

### Notes

- Cursor MCP config (`~/.cursor/mcp.json`) is **not** stowed — contains API keys.
- `node_modules/` under `.config/opencode/` is gitignored.
- Pre-migration backup: `~/agent-config-backup-20260728.tar.gz`.
