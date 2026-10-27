#!/usr/bin/env bash
# Builds dist/debriefing-codex-plugin.zip for the OpenAI plugin directory.
# The ZIP root is the plugin root: .codex-plugin/plugin.json, .mcp.json,
# skills/, assets/, README.md and LICENSE. The Claude and Grok manifests stay out.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PLUGIN="$ROOT/plugins/debriefing"
OUT="$ROOT/dist/debriefing-codex-plugin.zip"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

mkdir -p "$STAGE/.codex-plugin" "$ROOT/dist"
cp "$PLUGIN/.codex-plugin/plugin.json" "$STAGE/.codex-plugin/plugin.json"
cp -R "$PLUGIN/skills" "$PLUGIN/assets" "$PLUGIN/README.md" "$STAGE/"
cp "$ROOT/LICENSE" "$STAGE/LICENSE"
# Codex's .mcp.json example takes a bare url, without the "type" key.
cat > "$STAGE/.mcp.json" <<'JSON'
{
  "mcpServers": {
    "debriefing": {
      "url": "https://debriefing.io/mcp"
    }
  }
}
JSON

rm -f "$OUT"
(cd "$STAGE" && find . -name .DS_Store -delete && zip -qrX "$OUT" .)
echo "$OUT"
