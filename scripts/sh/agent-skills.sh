#!/usr/bin/env bash
# agent-skills.sh — link the global skills hub into every coding agent.
#
# Hub: ~/.agents/skills (real dirs, managed by the `skills` CLI).
# Every agent gets symlinks to the full hub.
#
# Idempotent: re-run after adding/removing hub skills. Broken links are
# pruned at the end. Never touches: codex .system, cursor skills-cursor.
set -euo pipefail

HUB="$HOME/.agents/skills"

AGENT_DIRS=(
  "$HOME/.claude/skills"
  "$HOME/.openclaude/skills"
  "$HOME/.codex/skills"
  "$HOME/.cursor/skills"
  "$HOME/.config/opencode/skills"
)

link_into() {
  local target="$1"; shift
  mkdir -p "$target"
  local skill
  for skill in "$@"; do
    ln -sfn "$HUB/$skill" "$target/$skill"
  done
}

mapfile -t ALL_SKILLS < <(ls "$HUB")

for dir in "${AGENT_DIRS[@]}"; do
  link_into "$dir" "${ALL_SKILLS[@]}"
done

# prune links whose hub target disappeared
for dir in "${AGENT_DIRS[@]}"; do
  find "$dir" -maxdepth 1 -xtype l -delete
done

echo "linked ${#ALL_SKILLS[@]} skills into ${#AGENT_DIRS[@]} agents"
