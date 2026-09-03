#!/usr/bin/env bash
# Lexi - Legal & Compliance Advisor : installer
# Installs the Lexi agent, its knowledge base, and the bundled israeli-* skills
# into your Claude Code config. Merge-not-clobber: existing files are backed up,
# and your learned memory.md is never overwritten.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_HOME:-$HOME/.claude}"
STAMP="$(date +%Y%m%d-%H%M%S)"

echo "==> Installing Lexi into: $CLAUDE_DIR"
mkdir -p "$CLAUDE_DIR/agents" "$CLAUDE_DIR/skills" "$CLAUDE_DIR/lexi/knowledge"

# Backups live OUTSIDE ~/.claude/skills so Claude Code never scans them as skills.
BACKUP_DIR="$CLAUDE_DIR/.lexi-backups/$STAMP"

backup_if_exists() {
  local target="$1"
  if [ -e "$target" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -R "$target" "$BACKUP_DIR/$(basename "$target")"
    echo "    backed up existing -> $BACKUP_DIR/$(basename "$target")"
  fi
}

# 1) Agent
backup_if_exists "$CLAUDE_DIR/agents/lexi.md"
cp "$SRC/agents/lexi.md" "$CLAUDE_DIR/agents/lexi.md"
echo "==> Agent installed: agents/lexi.md"

# 2) Bundled skills (israeli-*)
for skill in "$SRC"/skills/*/; do
  name="$(basename "$skill")"
  backup_if_exists "$CLAUDE_DIR/skills/$name"
  rm -rf "$CLAUDE_DIR/skills/$name"
  cp -R "$skill" "$CLAUDE_DIR/skills/$name"
  echo "    skill installed: $name"
done

# 3) Knowledge base
cp "$SRC/knowledge/index.md"          "$CLAUDE_DIR/lexi/knowledge/index.md"
cp "$SRC/knowledge/regulatory-map.md" "$CLAUDE_DIR/lexi/knowledge/regulatory-map.md"
if [ ! -e "$CLAUDE_DIR/lexi/knowledge/memory.md" ]; then
  cp "$SRC/knowledge/memory.md" "$CLAUDE_DIR/lexi/knowledge/memory.md"
  echo "==> Knowledge base installed (fresh memory.md)"
else
  echo "==> Knowledge base updated (kept your existing memory.md)"
fi

cat <<'MSG'

==> Core install complete. Lexi + 8 bundled skills are ready.

    Restart Claude Code, then call the agent (e.g. "use the lexi agent").

------------------------------------------------------------------
OPTIONAL: referenced Anthropic skills (not bundled in this repo).
Lexi also calls legal:*, pdf, and docx. Install them once from the
official marketplaces:

    claude plugin marketplace add anthropics/knowledge-work-plugins
    claude plugin install legal@knowledge-work-plugins

    claude plugin marketplace add anthropics/anthropic-agent-skills
    # then enable the pdf and docx skills from that marketplace

Lexi still works without them - the israeli-* skills are the core.
------------------------------------------------------------------
MSG
