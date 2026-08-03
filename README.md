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

Skills use a hub-and-spoke model. The hub (`~/.agents/skills/`) holds real skill dirs; each agent's `skills/` dir symlinks into it:

```
~/.agents/skills/        ← hub (real dirs, not stowed)
~/.claude/skills/        ← symlinks to hub
~/.openclaude/skills/    ← symlinks to hub
~/.codex/skills/         ← symlinks to hub
~/.cursor/skills/        ← symlinks to hub
~/.config/opencode/skills/  ← symlinks to hub
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
| `~/.agents/skills/` | Hub — real skill dirs | `skills` CLI + manual |
| `~/.agents/.skill-lock.json` | Installed skills registry | `skills` CLI |
| `scripts/sh/agent-skills.sh` | Symlink hub skills → all agents | Manual re-run |

### Editing global rules

Edit `dotfiles/.agents/global/AGENTS.md`. All four agents read it through the chain. No copies, no syncing.

### Adding a custom skill

1. `mkdir -p ~/.agents/skills/my-skill`
2. Write the prompt as `SKILL.md` inside it.
3. Run `scripts/sh/agent-skills.sh` to link it into all agents.

### Installing external skills

```
npx skills add vercel-labs/skills    # clones into ~/.agents/skills/<name>/
scripts/sh/agent-skills.sh            # re-link so all agents pick it up
npx skills sync                       # reinstall from ~/.agents/.skill-lock.json
```

### `agent-skills.sh`

Links all hub skills into every agent's `skills/` dir:

| Agent | Skills linked |
|---|---|
| Claude Code, openclaude, Codex, Cursor, opencode | Full hub |

- Idempotent — safe to re-run any time.
- Prunes broken links (skills removed from the hub).
- Never touches Codex `.system/` or Cursor `skills-cursor/`.

### Fresh machine setup

```
cd ~/dotfiles
stow .                                    # create all symlinks
(cd ~/.config/opencode && npm install)    # opencode plugin deps
./scripts/sh/agent-skills.sh              # link skills hub → all agents
npx skills sync                           # reinstall external skills from lockfile
```

### Notes

- Cursor MCP config (`~/.cursor/mcp.json`) is **not** stowed — contains API keys.
- `node_modules/` under `.config/opencode/` is gitignored.
- Pre-migration backup: `~/agent-config-backup-20260728.tar.gz`.