# Claude Code Status Line

A custom status line configuration for [Claude Code](https://claude.ai/code) that displays key session info at the bottom of your terminal.

## What it shows

```
[Opus] Context: 12% | Tokens: 48350
```

- **Model name** — which Claude model you're using (Opus, Sonnet, Haiku, etc.)
- **Context usage** — percentage of the context window used
- **Token count** — total input + output tokens consumed in the session

## Installation

### Option 1: Inline (no extra files)

Add the following to your `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "jq -r '\"[\\(.model.display_name // \"Unknown\")] Context: \\((.context_window.used_percentage // 0) | floor)% | Tokens: \\(((.context_window.total_input_tokens // 0) + (.context_window.total_output_tokens // 0)))\"'"
  }
}
```

### Option 2: Script file

1. Copy `statusline.sh` to `~/.claude/statusline.sh`
2. Make it executable: `chmod +x ~/.claude/statusline.sh`
3. Add the following to your `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/statusline.sh"
  }
}
```

## Requirements

- [Claude Code](https://claude.ai/code)
- `jq` (command-line JSON processor)

## Version

See [CHANGELOG.md](CHANGELOG.md) for release history.

## License

MIT
