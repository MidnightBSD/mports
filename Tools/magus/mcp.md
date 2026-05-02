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

```json
{
  "mcpServers": {
    "magus": {
      "type": "http",
      "url": "https://www.midnightbsd.org/magus/auth/mcp.cgi",
      "headers": {
        "Authorization": "Basic <base64-encoded-user:password>"
      }
    }
  }
}
```

Replace `<base64-encoded-user:password>` with the Base64 encoding of your
credentials:

```sh
printf 'myuser:mypassword' | base64
```

Paste the output directly into the `Authorization` header value after `Basic `.

---

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

## Example workflow

```
# 1. Find which architectures built devel/git and whether it passed
lookup_port name="devel/git"

# 2. If a failure is found, get details to understand the dependency chain
get_port_details port_id=12345

# 3. Pull the build log to analyze the failure
get_port_log port_id=12345

# 4. Check overall run health for the run that contains the failure
get_run_stats run_id=99
```

---

## Source

The CGI script lives at:

```
Tools/magus/www/data/magus/auth/mcp.cgi
```

It requires HTTP Basic Auth (configured via `Tools/magus/www/data/magus/auth/.htaccess`).
The credentials file is `/home/mbsd/magus/magus-passwd` on the server.
