# Magus MCP Server

The Magus MCP server exposes MidnightBSD package build cluster data to LLM CLI
tools (Claude Code, Codex, Gemini CLI, etc.) via the
[Model Context Protocol](https://modelcontextprotocol.io/) (JSON-RPC 2.0 over HTTP).

**Endpoint:** `https://www.midnightbsd.org/magus/auth/mcp.cgi`<br>
**Auth:** none<br>
**Protocol versions:** `2025-06-18`, `2025-03-26`, `2024-11-05`

---

## Claude Code configuration

Add the following to your Claude Code MCP settings. The recommended location is
your user-level settings file (`~/.claude/settings.json`) so the server is
available in every project.

claude mcp add --transport http magus https://www.midnightbsd.org/magus/auth/mcp.cgi

---

## codex configuration

Add this to ~/.codex/config.toml:

  [mcp_servers.magus]
  transport = "streamable_http"
  url = "https://www.midnightbsd.org/magus/auth/mcp.cgi"

## Available tools

### `lookup_port`

Look up the latest build results for a port across all CPU architectures.
Searches the latest complete blessed and unblessed runs per arch and OS version.

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

### `get_log_excerpt`

Retrieve a focused excerpt from a build log. If `pattern` is provided, Magus
returns context around the last matching line. Otherwise, it returns the end of
the log.

| Parameter       | Type    | Required | Description |
|-----------------|---------|----------|-------------|
| `port_id`       | integer | yes      | Port ID |
| `pattern`       | string  | no       | Literal text to search for in the log |
| `context_lines` | integer | no       | Lines around the match (default: 8, max: 50) |
| `tail_bytes`    | integer | no       | Bytes from the end of the log when `pattern` is omitted (default: 20000, max: 100000) |

---

### `get_port_details`

Get full details for a port: metadata, build events, all dependencies with
their statuses, and reverse-dependency count.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|
| `port_id` | integer | yes      | Port ID |

---

### `get_port_events`

Return build events for a port, optionally filtered by event type, phase, or
machine.

| Parameter    | Type    | Required | Description |
|--------------|---------|----------|-------------|
| `port_id`    | integer | yes      | Port ID |
| `type`       | string  | no       | Event type filter |
| `phase`      | string  | no       | Event phase filter |
| `machine_id` | integer | no       | Machine ID filter |
| `limit`      | integer | no       | Maximum events to return (default: 100, max: 500) |

---

### `get_dependency_blockers`

Walk a port dependency graph and list failed or skipped dependencies that are
likely blocking the selected port.

| Parameter   | Type    | Required | Description |
|-------------|---------|----------|-------------|
| `port_id`   | integer | yes      | Port ID |
| `max_depth` | integer | no       | Maximum dependency depth to walk (default: 8, max: 20) |
| `limit`     | integer | no       | Maximum blockers to return (default: 50, max: 200) |

---

### `get_distfiles`

Return distfiles, restricted distfiles, and master sites recorded for a port.
Non-HTTPS master sites are flagged in the response.

| Parameter | Type    | Required | Description |
|-----------|---------|----------|-------------|
| `port_id` | integer | yes      | Port ID |

---

### `get_port_cves`

Look up CVE information for a Magus port using its CPE data.

| Parameter     | Type    | Required | Description |
|---------------|---------|----------|-------------|
| `port_id`     | integer | no       | Port ID |
| `name`        | string  | no       | Port origin or bare name; used when `port_id` is omitted |
| `include_raw` | boolean | no       | Include the raw JSON returned by the CVE API |

Pass either `port_id` or `name`.

---

### `list_run_ports`

List ports in a run with filters useful for finding failures or narrowing a
debugging target.

| Parameter  | Type    | Required | Description |
|------------|---------|----------|-------------|
| `run_id`   | integer | yes      | Run ID |
| `status`   | string  | no       | Port status filter such as `fail`, `skip`, `warn`, `pass`, or `untested` |
| `name`     | string  | no       | Port origin substring |
| `category` | string  | no       | Category filter such as `devel` or `www` |
| `pkgname`  | string  | no       | Package name substring |
| `flavor`   | string  | no       | Flavor filter |
| `limit`    | integer | no       | Maximum ports to return (default: 100, max: 500) |

---

### `search_ports`

Search ports across runs using structured filters.

| Parameter   | Type    | Required | Description |
|-------------|---------|----------|-------------|
| `name`      | string  | no       | Port origin or origin substring |
| `pkgname`   | string  | no       | Package name substring |
| `status`    | string  | no       | Port status filter |
| `arch`      | string  | no       | Architecture filter |
| `osversion` | string  | no       | OS version filter |
| `flavor`    | string  | no       | Flavor filter |
| `run_id`    | integer | no       | Run ID filter |
| `limit`     | integer | no       | Maximum ports to return (default: 100, max: 500) |

At least one filter is required.

---

### `compare_port_runs`

Compare one port origin or name across two runs and show status, version, and
package differences.

| Parameter  | Type    | Required | Description |
|------------|---------|----------|-------------|
| `name`     | string  | yes      | Port origin or bare name |
| `run_id_a` | integer | yes      | First run ID |
| `run_id_b` | integer | yes      | Second run ID |

---

### `get_machine_events`

Return recent build events for a machine in a run.

| Parameter    | Type    | Required | Description |
|--------------|---------|----------|-------------|
| `run_id`     | integer | yes      | Run ID |
| `machine_id` | integer | yes      | Machine ID |
| `limit`      | integer | no       | Maximum events to return (default: 100, max: 500) |

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
get_dependency_blockers port_id=12345

# 3. Pull the build log or a targeted excerpt to analyze the failure
get_port_log port_id=12345
get_log_excerpt port_id=12345 pattern="error:" context_lines=8
analyze_build_log port_id=12345 model="qwen2.5-coder:14b"

# 4. Check overall run health for the run that contains the failure
get_run_stats run_id=99
list_run_ports run_id=99 status=fail limit=25

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

The endpoint is currently public and does not require HTTP Basic Auth.
