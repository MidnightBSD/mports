---
description: Fetch GitHub PR review comments and create todos to address them
---

Fetch review comments from a GitHub PR in this repository and create a todo list to address each comment.

# Instructions

1. **Determine the current repository:**
  ```bash
  REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)
  ```

2. Extract the PR number, optional review ID, and repository from the user's message:
  - PR number only: "12345" or "https://github.com/org/repo/pull/12345"
  - Specific review: "https://github.com/org/repo/pull/12345#pullrequestreview-123456789"

  **If the input is a GitHub URL**, parse it to override `REPO`, `PR_NUMBER`, and optionally `REVIEW_ID`:
  ```bash
  INPUT="https://github.com/org/repo/pull/12345#pullrequestreview-123456789"

  # Extract org/repo (two path segments after github.com/)
  REPO=$(echo "$INPUT" | sed 's|https://github.com/||' | cut -d/ -f1-2)

  # Extract PR number (path segment after /pull/)
  PR_NUMBER=$(echo "$INPUT" | sed 's|.*\/pull\/||' | cut -d/ -f1 | cut -d'#' -f1)

  # Extract review ID from fragment (digits after "pullrequestreview-"), if present
  REVIEW_ID=$(echo "$INPUT" | grep -o 'pullrequestreview-[0-9]*' | cut -d- -f2)
  ```

  **If the input is a plain PR number**, use it directly and keep `REPO` from Step 1:
  ```bash
  PR_NUMBER="12345"
  REVIEW_ID=""
  ```

3. Fetch review comments:

  **If a specific review ID is provided:**
  ```bash
  gh api --paginate repos/${REPO}/pulls/${PR_NUMBER}/reviews/${REVIEW_ID}/comments | jq '[.[] | {path: .path, body: .body, line: .line, start_line: .start_line, user: .user.login}]'
  ```

  **If only PR number is provided:**
  ```bash
  gh api --paginate repos/${REPO}/pulls/${PR_NUMBER}/comments | jq '[.[] | {path: .path, body: .body, line: .line, start_line: .start_line, user: .user.login}]'
  ```

4. Parse the JSON output and create a todo list with TodoWrite containing:
  - One todo per review comment
  - Generate a unique id for each todo (e.g., sequential integers: "1", "2", "3")
  - Format: "{file}:{line} - {comment_summary} (@{username})" (content)
  - All todos should start with status: "pending"

5. Present the todos to the user - DO NOT automatically start addressing them
  - Show a summary of how many comments were found
  - List the todos clearly
  - Wait for the user to tell you which ones to address

# Example Usage

User: `/address-review https://github.com/org/repo/pull/12345#pullrequestreview-123456789`
User: `/address-review 12345`
User: `/address-review https://github.com/org/repo/pull/12345`

# Important Notes

- Automatically detect the repository using `gh repo view` for the current working directory
- If a GitHub URL is provided, extract the org/repo from the URL
- Include file path and line number in each todo for easy navigation
- Include the reviewer's username in the todo text
- If a comment doesn't have a specific line number, note it as "general comment"
- **NEVER automatically address all review comments** - always wait for user direction
- When given a specific review URL, no need to ask for more information
