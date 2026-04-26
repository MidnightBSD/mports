# AGENTS.md

Instructions for coding agents working in MidnightBSD mports.

## Overview

This is the MidnightBSD mports, a collection of ports Makefiles and patches to
build applications on the MidnightBSD operating system.

All changes must support the current stable release and the current development branch of MidnightBSD.

If an AI-assisted commit is created, use `git commit -s` and include an `AI-Assisted-by:` trailer for the agent actually used. Example:

    AI-Assisted-by: Claude Sonnet 4.6 <noreply@anthropic.com>

## Building ports

Prefer `bmake` (BSD make) unless the port requires another tool (e.g., `gmake`, `cmake`, `ninja`, `maven`, `gradle`).

When developing or updating a port, validate it end-to-end:
- `bmake makesum`  # regenerate distinfo whenever DISTVERSION or sources change
- `bmake patch`
- `bmake`
- `bmake fake`
- `bmake package`
- `bmake test` (if available; if tests fail, ask whether to fix or to disable with `NO_TEST` and why)

For new ports, generate an initial `pkg-plist` after staging:
- `bmake fake && bmake makeplist` — review and trim the result; do not include directories owned by other ports.
- Add `@dir` commands near the bottom of `pkg-plist` for any directories the port creates that are not owned by a dependency (e.g., `@dir lib/myapp`).

If `portlint` is available, run it before committing. If it is not installed, skip this step — do not install it automatically.

Staging notes:
- `fake` installs into `${FAKE_DESTDIR}` (similar to FreeBSD `STAGEDIR`).
- `do-install` and `fake-install` targets receive `${FAKE_DESTDIR}` pre-pended to `${PREFIX}` automatically.
- Targets named `do-install-*` or `do-fake-*` do not — pass `${FAKE_DESTDIR}${PREFIX}` explicitly in those.

Patch file conventions:
- Patch files go in `files/` and must be named `patch-*` (e.g., `patch-src_foo_bar.c`).
- Path separators in the original filename become underscores in the patch name.

## MidnightBSD versions

| Branch      | Version | FreeBSD base  | Status          |
|-------------|---------|---------------|-----------------|
| stable/4.0  | 4.0     | 13-stable     | Current stable  |
| stable/3.2  | 3.2     | 12.4          | Previous stable |
| master      | 4.1     | —             | Development     |

Ports must work on stable/4.0. Support for stable/3.2 is maintained where practical. The master branch (4.1) tracks ongoing development and may have additional capabilities.

## Quarterly snapshot branches

Quarterly snapshot branches are named `YYYYQn` where `n` is 1–4 (e.g., `2026Q2` for April–June 2026). They provide stable snapshots of the ports tree for users who prefer infrequent, tested updates over rolling master.

Quarter mapping:
- Q1: January–March
- Q2: April–June
- Q3: July–September
- Q4: October–December

At the start of any session, check whether the current quarter's branch exists on the remote:

```sh
git fetch origin
git branch -r | grep origin/$(date +%YQ)$(($(date +%-m)/4+1))
```

If the branch is absent, notify the user and offer to create it from master:

```sh
git checkout -b 2026Q2 origin/master
git push -u origin 2026Q2
```

Do not create the branch automatically — ask the user to confirm first.

## Porting software

MidnightBSD 4.0 is based on FreeBSD 13-stable; MidnightBSD 3.2 is based on FreeBSD 12.4. FreeBSD-oriented software often works with small portability fixes:
- Add `midnightbsd` to configure/cmake OS detection when needed (or use compatible FreeBSD version checks where appropriate).
- libc includes OpenBSD `ohash`; libutil differs from FreeBSD. MidnightBSD 4.0.4+ provides `agev_get_age_bracket(const char *username)`.
- Base includes `sqlite3` with a `pkg-config` file. Perl is not in base on 4.0+ (use a package if needed).
- Package management uses `mport` (not FreeBSD `pkg`). Do not reference `pkg` in user-facing instructions, scripts, or documentation; use `mport install` instead.
