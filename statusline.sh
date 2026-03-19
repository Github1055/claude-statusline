#!/bin/bash
# Claude Code Status Line v1.1.0
# Displays: [Model] Context: X% | Tokens: NNNN | Cost: $X.XX
#
# Usage: Set in ~/.claude/settings.json as:
#   { "statusLine": { "type": "command", "command": "~/.claude/statusline.sh" } }

input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
CONTEXT_PCT=$(echo "$input" | jq -r '(.context_window.used_percentage // 0) | floor')
TOTAL_TOKENS=$(echo "$input" | jq -r '((.context_window.total_input_tokens // 0) + (.context_window.total_output_tokens // 0))')
COST=$(echo "$input" | jq -r '(.cost.total_cost_usd // 0) | . * 100 | round | . / 100 | tostring | if test("\\.") then . else . + ".00" end')

echo "[$MODEL] Context: ${CONTEXT_PCT}% | Tokens: ${TOTAL_TOKENS} | Cost: \$${COST}"
