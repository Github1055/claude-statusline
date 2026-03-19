#!/bin/bash
# Claude Code Status Line v1.0.0
# Displays: [Model] Context: X% | Tokens: NNNN
#
# Usage: Set in ~/.claude/settings.json as:
#   { "statusLine": { "type": "command", "command": "~/.claude/statusline.sh" } }

input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
CONTEXT_PCT=$(echo "$input" | jq -r '(.context_window.used_percentage // 0) | floor')
TOTAL_TOKENS=$(echo "$input" | jq -r '((.context_window.total_input_tokens // 0) + (.context_window.total_output_tokens // 0))')

echo "[$MODEL] Context: ${CONTEXT_PCT}% | Tokens: ${TOTAL_TOKENS}"
