#!/usr/bin/env bash
# This script is called by Gemini CLI before any file is written.
# It uses Gemini 3 Flash to scan the 'proposed_content' for vulnerabilities.

# Gemini CLI passes the proposed change via stdin as JSON.
# We pipe it to a quick Flash-Lite check.
AUDIT_RESULT=$(cat | gemini -m gemini-3-flash-lite "Analyze this code diff for security flaws like SQLi, hardcoded keys, or buffer overflows. Output only VALID or INVALID.")

if [[ "$AUDIT_RESULT" == *"INVALID"* ]]; then
  echo '{"decision": "deny", "reason": "Security audit failed. Proposed change contains vulnerabilities."}'
  exit 2
else
  echo '{"decision": "allow"}'
  exit 0
fi
