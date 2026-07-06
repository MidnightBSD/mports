---
name: port-from-freebsd
description: Create a new MidnightBSD mport by importing a FreeBSD port. Use when the user asks to port, import, or copy a FreeBSD port into mports (e.g. "port devel/foo from FreeBSD", "create a MidnightBSD port for editors/bar"). Prefers a local /usr/ports tree, falls back to the freebsd/freebsd-ports GitHub mirror, then adapts the port to MidnightBSD conventions (MAINTAINER, LICENSE naming, mport vs pkg, dependency compatibility) and validates the build.
---

# Port from FreeBSD

## Overview

Turn a FreeBSD port into a working MidnightBSD mport under `/usr/mports/<category>/<port>`, adapted to MidnightBSD conventions and validated end to end. Do the smallest set of changes needed to make the port correct on MidnightBSD; do not rewrite a working FreeBSD port.

Read `AGENTS.md` for the authoritative mports conventions (USES, licenses, staging with `FAKE_DESTDIR`, pkg-plist, PORTREVISION, versions). This skill layers the import-specific workflow on top of it.

## Reference facts

MidnightBSD ↔ FreeBSD base mapping (compatibility gate):

| MidnightBSD branch | Version | FreeBSD base | OSVERSION range |
|--------------------|---------|--------------|-----------------|
| master             | 4.1     | —            | development     |
| stable/4.0         | 4.0     | 13-stable    | 1300000–1399999 |
| stable/3.2         | 3.2     | 12.4         | 1204000         |

Current MidnightBSD compatibility level is **FreeBSD 13.x**. A port that requires FreeBSD 14+ base features is not portable as-is — warn the user (see step 3).

FreeBSD → MidnightBSD `LICENSE` identifier differences (most identifiers match; these are the common ones that do not):

| FreeBSD id | MidnightBSD id |
|------------|----------------|
| `APACHE10` | `Apache-1.0`   |
| `APACHE11` | `Apache-1.1`   |
| `APACHE20` | `Apache-2.0`   |

`mit`, `gpl2`, `gpl2+`, `gpl3`, `gpl3+`, `lgpl21`→`lgpl2.1`, `bsd2`, `bsd3`, `iscl`, `zlib`, `unlicense`, `CC0-1.0` and most others match. Always verify against the mports list rather than assuming — run `bmake license-list` or grep `Mk/components/licenses.db.mk`, and validate with `bmake check-license`.

## Workflow

1. Resolve the source and destination origin.
   - Establish the `<category>/<port>` origin from the user's request. Ask only if the origin is genuinely ambiguous.
   - If `/usr/mports/<category>/<port>` already exists, this is an update, not a create — tell the user and stop unless they confirm overwrite. Do not clobber an existing mport.
   - Confirm the destination category directory exists under `/usr/mports`. If it does not, warn the user (a new category needs a `Makefile` entry) and ask before creating one.

2. Obtain the FreeBSD port sources.
   - **Local first:** if `/usr/ports/<category>/<port>` exists, copy from it. Copy `Makefile`, `distinfo`, `pkg-descr`, `pkg-plist`, `pkg-message`, `files/`, and any port-specific `*.mk`/`Makefile.*`. Do NOT copy `work/`, `.orig` files, or FreeBSD-generated cruft.
   - **GitHub fallback:** if there is no local tree, fetch from the `freebsd/freebsd-ports` mirror (`main` branch). List the directory via the GitHub contents API `https://api.github.com/repos/freebsd/freebsd-ports/contents/<category>/<port>` and fetch each file from `https://raw.githubusercontent.com/freebsd/freebsd-ports/main/<category>/<port>/<path>`. Recurse into `files/`. Use `fetch` or `curl`; state that the mirror was used.
   - Record the upstream `PORTVERSION`/`DISTVERSION` and `PORTREVISION` you started from.

3. Compatibility gate — check the required FreeBSD level BEFORE adapting.
   - Scan the Makefile and `files/` for version gates: `OSVERSION` comparisons, `.if ${OSVERSION} >= 14*`, `IGNORE`/`BROKEN_FreeBSD_1[34]`, `USES` or dependencies that require FreeBSD 14+ base (e.g. new libc symbols, base LLVM version, WITH_* base knobs).
   - If the port needs a FreeBSD level **newer than 13.x**, warn the user prominently and ask how to proceed: (a) attempt anyway with compatibility shims, or (b) import an older port version that targets FreeBSD 13.x. Do not silently proceed.
   - Note MidnightBSD portability specifics from `AGENTS.md`: Perl is not in base on 4.0+, package tool is `mport` not `pkg`, libutil differs, base ships `sqlite3` + `ohash`. Add `midnightbsd` to OS detection (configure/cmake/`OSVERSION`-style checks) where the port keys on `freebsd`.

4. Adapt to MidnightBSD conventions (minimal edits).
   - **MAINTAINER:** set to `ports@MidnightBSD.org` unconditionally.
   - **LICENSE:** map the identifier using the table above; verify it exists in the mports list. If FreeBSD used `unknown` or an unlisted license, define a proper custom license (`LICENSE_NAME`, `LICENSE_PERMS`, `LICENSE_FILE`/`LICENSE_TEXT`) rather than carrying `unknown`. If the upstream license appears to have changed, do NOT change it silently — present old vs new and ask. Run `bmake check-license`.
   - **pkg → mport:** replace any user-facing `pkg` references in `pkg-message`, `pkg-descr`, and scripts with `mport install` / `mport` wording. Do not reference FreeBSD `pkg` in installed messages.
   - **Architecture patches:** keep i386, amd64, ARM, riscv, and LLVM (plus mips/wasm/GPU for LLVM) patches. Remove sparc64/powerpc-only patches unless they cover shared upstream code.
   - **Staging:** follow the `FAKE_DESTDIR` rules — base `do-install:` with option sub-targets uses `${PREFIX}` directly (no `FAKE_DESTDIR`); `do-install-FOO-on:` sub-targets use `${FAKE_DESTDIR}${PREFIX}`. See the mports staging memory.
   - Keep `USES`, options, and framework mechanisms as-is unless MidnightBSD requires a change.

5. Dependency compatibility.
   - Enumerate `BUILD_DEPENDS`, `RUN_DEPENDS`, `LIB_DEPENDS`, and `USES`-implied deps. For each, confirm the provider exists in `/usr/mports` and is version-compatible with what the port expects.
   - Check default versions (`Mk/bsd.default-versions.mk` in mports vs the FreeBSD assumptions the port makes: Python, PHP, Ruby, PostgreSQL, etc.). A mismatch is a compatibility issue.
   - If a dependency is **missing** or **too old**: prefer updating/adding that dependency. Bump `PORTREVISION` on consumers if a shared-library version changes (see `Tools/scripts/bump_revision.pl`).
   - If a dependency **cannot** be made compatible: STOP and ask the user to choose — update the dependency (and any transitive chain), or import an older version of this port that works against the available dependency versions. Do not force an incompatible build.

6. Generate/trim the packing list and stage.
   - `bmake makesum` (regenerate `distinfo` for the mports Distfiles path).
   - `bmake patch`, then `bmake fake`.
   - For plist drift, `bmake makeplist` produces a `gen-plist`; reconcile it with the imported `pkg-plist` — add `@dir` for unowned directories, `@sample` for `.sample` config, and the `fc-cache` `@postexec` line for font ports. Do not list directories owned by dependencies.

7. Run portlint (and portfmt if present).
   - If `portlint` is installed (`which portlint`), run it on the port and fix the issues it reports (ordering, whitespace, comment/description length, deprecated macros, missing `@dir`, etc.). Do NOT install portlint if it is absent — skip and say so.
   - Optionally run `portfmt` from `ports-mgmt/portfmt` to normalize Makefile formatting if installed.
   - Re-run portlint until clean or until the only remaining warnings are intentional and explained.

8. Validate the build chain.
   - Run the mports pipeline as applicable: `bmake makesum`, `bmake patch`, `bmake`, `bmake fake`, `bmake package`, and `bmake test` if the port defines tests. If tests fail, ask whether to fix or disable with `NO_TEST` and why.
   - Fix a failure with one targeted change when the cause is clear; otherwise stop and report. State any stage skipped and why.

9. Finish only as requested.
   - Commit only when explicitly asked. Use `git commit -s` with an `AI-Assisted-by:` trailer for the agent used.
   - Per `AGENTS.md`, create a dedicated branch `<category>/<portname>` and open one PR per port (prefer `gh`). Commit directly to another branch (e.g. master) only if the user explicitly requests it.

## Reporting

Report: source used (local `/usr/ports` vs GitHub mirror), starting FreeBSD version/revision, compatibility-gate result (and any FreeBSD 14+ warning), the adaptations made (MAINTAINER, LICENSE mapping, mport wording, arch patches, OS detection), dependency findings and any user decision requested, portlint status, and which validation stages passed, failed, or were skipped. If you stopped to ask about a dependency or compatibility conflict, say so plainly rather than guessing.
