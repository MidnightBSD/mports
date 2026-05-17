# Magus MCP Server

The Magus MCP server exposes MidnightBSD package build cluster data to LLM CLI
tools (Claude Code, Codex, Gemini CLI, etc.) via the
[Model Context Protocol](https://modelcontextprotocol.io/) (JSON-RPC 2.0 over HTTP).

**Endpoint:** `https://www.midnightbsd.org/magus/auth/mcp.cgi`  
**Auth:** HTTP Basic Auth (same credentials as the Magus web UI)  
**Protocol version:** `2024-11-05`

---

## Claude Code configuration

Add the following to your Claude Code MCP settings. The recommended location is
your user-level settings file (`~/.claude/settings.json`) so the server is
available in every project.

claude mcp add --transport http magus https://www.midnightbsd.org/magus/auth/mcp.cgi --header "Authorization: <base64-encoded-user:password>"

Replace `<base64-encoded-user:password>` with the Base64 encoding of your
credentials:

```sh
printf 'myuser:mypassword' | base64
```

Paste the output directly into the `Authorization` header value after `Basic `.

---

## codex configuration

export MAGUS_BASIC_AUTH='Basic <base64-encoded-user:password>'

  Then add this to ~/.codex/config.toml:

  [mcp_servers.magus]
  transport = "streamable_http"
  url = "https://www.midnightbsd.org/magus/auth/mcp.cgi"
  env_http_headers = { Authorization = "MAGUS_BASIC_AUTH" }

## Available tools

### `lookup_port`

Look up the latest build results for a port across all CPU architectures.
Searches the most recent blessed complete run per arch.

| Parameter | Type   | Required | Description |
|-----------|--------|----------|-------------|
| `name`    | string | yes      | Port origin (`www/apache24`, `devel/git`) or a bare name substring (`apache24`) |

Returns port IDs, status, version, arch, OS version, and run ID for each match.
Use the returned `port_id` with `get_port_log` or `get_port_details`.

---

### `get_run_stats`

Get package statistics (pass / fail / skip / warn / untested counts) for a
build run.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|
| `run_id`  | integer | no       | Specific run ID. Omit to get the latest blessed run per architecture. |

---

### `list_runs`

List recent Magus build runs.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|
| `limit`   | integer | no       | Number of runs to return (default: 20, max: 100) |
| `status`  | string  | no       | Filter by run status: `active`, `complete`, or `pending` |
| `arch`    | string  | no       | Filter by CPU architecture (e.g. `amd64`, `aarch64`) |

---

### `get_port_log`

Retrieve the build log for a port. Large logs are automatically truncated to
the final 100 KB, which is where build failures appear.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|
| `port_id` | integer | yes      | Port ID (from `lookup_port` or `get_port_details`) |

---

### `get_port_details`

Get full details for a port: metadata, build events, all dependencies with
their statuses, and reverse-dependency count.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|
| `port_id` | integer | yes      | Port ID |

---

### `analyze_build_log`

Analyze the build log of a failed port to explain the error using a local LLM.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|
| `port_id` | integer | yes      | Port ID of the failed build (from `lookup_port` or `get_port_details`) |
| `model`   | string  | no       | The LLM to use. Default is `qwen2.5-coder:14b`. Options: `phi4`, `deepseek-coder:6.7b`, `llama3.2:3b`, `qwen2.5-coder:14b`, `gemma4:latest`, `mistral-nemo:latest`, `mistral:7b`, `gemma3:latest`, `mistral-small-latest`, `mistral-medium-latest`, `mistral-large-latest` |

---

### `top_blockers`

List the highest-weight failed or skipped ports blocking other ports from building.
The weight is an approximate priority score, not an exact reverse-dependency count.
Higher weights should be fixed first.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|
| `run_id`  | integer | no       | Run ID to analyze. Omit to use the latest complete blessed run per architecture. |
| `limit`   | integer | no       | Maximum number of blockers to return per run (default: 20, max: 100). |

---

### `list_port_updates`

Returns a list of ports that have new versions available, as detected by portscout.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|

---

## Example workflow

```
# 1. Find which architectures built devel/git and whether it passed
lookup_port name="devel/git"

# 2. If a failure is found, get details to understand the dependency chain
get_port_details port_id=12345

# 3. Pull the build log to analyze the failure or use the automated log analysis
get_port_log port_id=12345
analyze_build_log port_id=12345 model="qwen2.5-coder:14b"

# 4. Check overall run health for the run that contains the failure
get_run_stats run_id=99

# 5. Check which ports are blocking the most other ports
top_blockers limit=10

# 6. Check for available port updates
list_port_updates
```

---

## Source

The CGI script lives at:

```
Tools/magus/www/data/magus/auth/mcp.cgi
```

It requires HTTP Basic Auth (configured via `Tools/magus/www/data/magus/auth/.htaccess`).
The credentials file is on the server.