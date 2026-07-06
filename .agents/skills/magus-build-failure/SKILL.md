---
name: magus-build-failure
description: Diagnose and fix MidnightBSD mports build failures reported by Magus. Use when the user provides a Magus port ID, asks to fix a failed Magus run, asks to inspect Magus logs, or needs a port patch driven by Magus build output. Requires using the Magus MCP log tools and `analyze_build_log` as an independent hypothesis to evaluate against the raw log and local port tree.
---

# Magus Build Failure

## Overview

Use this skill to turn a Magus failure into a minimal mports fix with evidence from the build cluster, local files, and targeted validation.

## Workflow

1. Identify the failing build.
   - If the user gave an origin or port name instead of an ID, use `mcp__magus.lookup_port` first and choose the failed result that matches the user's architecture or run context.
   - Use `mcp__magus.get_port_details` for the Magus port ID before reading logs. Record origin, architecture, run, status, phase, dependency context, and timestamps if available.
   - Map the origin to `/usr/mports/<category>/<port>` and inspect the local port files before editing.

2. Fetch primary log evidence.
   - Use `mcp__magus.get_port_log` for the full available tail.
   - Use `mcp__magus.get_log_excerpt` when the failure string needs focused context or the tail is noisy.
   - Treat the raw log as primary evidence. Extract the failing command, phase, first meaningful error, and any architecture-specific clue.

3. Get the independent analyzer opinion.
   - Call `mcp__magus.analyze_build_log` for the same port ID after fetching the raw log.
   - Compare the analyzer's diagnosis to the raw log and local files. Accept it only when the cited failure mode is visible in the log and matches the port's build system, dependencies, patches, plist, or framework usage.
   - If the analyzer is vague, hallucinated, outdated, or conflicts with the raw log, say so and proceed from the primary evidence.
   - Do not patch solely because `analyze_build_log` suggested it.

4. Reproduce or localize locally.
   - Inspect `Makefile`, `distinfo`, `pkg-plist`, `pkg-descr`, `files/`, options, and relevant build-system files under `work/` if already extracted.
   - Use the narrow local target that corresponds to the Magus phase: `bmake patch`, `bmake build`, `bmake fake`, `bmake package`, or `bmake test`.
   - Use dry-run and variable checks such as `bmake -n <target>` and `bmake -V <VAR>` when the log points to framework expansion, install paths, dependencies, or architecture-specific settings.

5. Patch minimally.
   - Prefer existing mports mechanisms: `USES`, options helpers, `post-patch`, `post-fake-*`, `SHEBANG_FILES`, dependency variables, and patch files under `files/`.
   - Keep changes compatible with MidnightBSD stable/4.0 and current development unless the local framework proves a narrower guard is required.
   - Preserve architecture patches for i386, amd64, ARM, riscv, LLVM targets, WebAssembly, and GPU targets. Do not preserve obsolete sparc64 or powerpc-only patches unless required by upstream-shared code.
   - Do not modify `Mk/bsd.mport.mk` without maintainer consultation.

6. Validate.
   - Run the narrow target matching the failed phase first.
   - For port updates or source changes, run the normal chain as applicable: `bmake makesum`, `bmake patch`, `bmake`, `bmake fake`, `bmake package`, and `bmake test` if available.
   - Run `portlint` if installed; do not install it automatically.
   - If patch files or plists changed, run `git diff --check`.
   - State any checks skipped because they are unavailable, too expensive, or blocked by pre-existing failures.

7. Finish only as requested.
   - Commit only when explicitly requested.
   - For modified ports, use a dedicated branch named `<category>/<portname>` and one port per PR when PR work is requested.
   - Prefer `gh` for PR operations when available.

## Analyzer Evaluation

When reporting or using `analyze_build_log`, explicitly classify it:

- `Supported`: the raw log contains the same failing command/error and local files show the proposed cause.
- `Partially supported`: the analyzer identified the broad area, but missed the concrete local fix.
- `Unsupported`: the analyzer diagnosis is not evidenced by the log or local tree.

Use the classification to guide the fix, but keep the final reasoning anchored to the raw log and local validation.

## Common Failure Patterns

- Dependency not found: compare the consumer atom against provider `PKGBASE`/`PORTNAME`; `mport.query` matching can be case-sensitive.
- Shebang or interpreter QA: use `USES+= shebangfix`, `SHEBANG_FILES`, or the port's language framework instead of ad hoc substitutions.
- Fake or plist path problems: inspect `bmake -n fake` or `bmake -n run-fake`; apply `${FAKE_DESTDIR}${PREFIX}` or fake-adjusted `${PREFIX}` exactly once.
- Truncated Magus tail: use excerpts around known error tokens, local dry-runs, and variable expansion rather than guessing.
- Architecture-only failure: inspect arch conditionals and avoid deleting patches for future MidnightBSD architectures unless they are obsolete sparc64/powerpc-only code.
- Test failure: determine whether tests are supported in the port; ask before disabling tests with `NO_TEST`.

## Reporting

Include the Magus port ID, origin, architecture, failing phase, raw error summary, analyzer classification, local change summary, and validation results. If no code change is made because the analyzer was wrong or the local tree already contains a fix, say that directly.
