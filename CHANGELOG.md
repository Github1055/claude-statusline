# Changelog

## v1.1.0 — 2026-03-19

### Added
- Display session cost in USD (e.g. `Cost: $0.42`), sourced from Claude Code's `cost.total_cost_usd` field

### Changed
- Updated inline `jq` command and script to include cost output

## v1.0.0 — 2026-03-19

- Initial release
- Displays current model name (Opus, Sonnet, Haiku, etc.)
- Displays context window usage as a percentage
- Displays total tokens used (input + output)
- Supports inline `jq` command or standalone script
