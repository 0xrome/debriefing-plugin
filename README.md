# Debriefing plugin

Debriefing is competitive intelligence for B2B teams. It watches your competitors and finds their moves, such as a price change, a launch or a new hire. Every signal carries its source evidence. This plugin brings that data into your agent. It connects the Debriefing MCP server and adds three skills.

## Install

**Claude Code:**

```
/plugin marketplace add 0xrome/debriefing-plugin
/plugin install debriefing@debriefing
```

**Grok Build:** open `/plugin`, search for **Debriefing**, and install.

**Codex:** add this repository as a plugin marketplace. The manifest is `.agents/plugins/marketplace.json`.

**Any other MCP client:** add `https://debriefing.io/mcp` as a remote MCP server. See the [developer docs](https://debriefing.io/developers?tab=mcp).

The first time a workspace tool runs, you sign in to Debriefing in your browser. You need a Debriefing workspace on a paid plan. Each plan starts with a 3-day trial that needs a card, and has a 14-day money-back guarantee. There is no free plan.

## What it does

The plugin connects the Debriefing MCP server at `https://debriefing.io/mcp`. It adds three skills.

- `weekly-competitor-review` reads what changed in the last 7 days, ranks the competitor moves by severity, checks the evidence behind each one, and ends with recommended actions. It only reads.
- `battlecard-from-signals` builds a sales battlecard for one competitor from its dossier, its recent signals and their sources. It saves a note or asks Debriefing for a rewrite only when you agree.
- `debriefing-api` explains the Debriefing read API and every MCP tool, with scopes, limits and error codes.

The plugin acts in one Debriefing workspace. It asks before it changes the workspace or uses a plan allowance. It never charges a card or deletes a workspace.

## Example prompts

- "What did my competitors change this week?"
- "Build a battlecard for my next sales call against a competitor."
- "Show me the evidence behind the latest high-severity signal."

## Layout

- `.claude-plugin/marketplace.json` lists the plugin for Claude Code.
- `.agents/plugins/marketplace.json` lists the plugin for Codex.
- `plugins/debriefing/` holds the plugin: the Claude, Codex and Grok manifests, `.mcp.json`, the skills and the icons.
- `scripts/build-codex-zip.sh` builds `dist/debriefing-codex-plugin.zip` for the OpenAI plugin directory.

## Privacy and support

- Privacy policy: https://debriefing.io/privacy_policy
- Terms: https://debriefing.io/terms
- Contact and support: https://debriefing.io/contact

## License

MIT. See `LICENSE`. The Debriefing service and its source code are proprietary.
