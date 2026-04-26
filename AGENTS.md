# AGENTS.md

Instructions for coding agents working in MidnightBSD mports.

## Overview

This is the MidnightBSD mports, a collection of ports Makefiles and patches to
build applications on the MidnightBSD operating system.

All changes must support the current stable release and the current development branch of MidnightBSD.

If an AI-assisted commit is created, use `git commit -s` and include an `AI-Assisted-by:` trailer for the agent actually used.

## Building ports

Prefer `bmake` (BSD make) unless the port requires another tool (e.g., `gmake`, `cmake`, `ninja`, `maven`, `gradle`).

When developing or updating a port, validate it end-to-end:
- `bmake patch`
- `bmake`
- `bmake fake`
- `bmake package`
- `bmake test` (if available; if tests fail, ask whether to fix or to disable with `NO_TEST` and why)

Staging notes:
- `fake` installs into `${FAKE_DESTDIR}` (similar to FreeBSD `STAGEDIR`).
- `do-install`/`fake-install` include `${FAKE_DESTDIR}` within `PREFIX`; `do-install-*`/`do-fake-*` do not, so apply `${FAKE_DESTDIR}` explicitly if needed.

## Porting software

MidnightBSD 4.0 is based on FreeBSD 13-stable; MidnightBSD 3.2 is based on FreeBSD 12.4. FreeBSD-oriented software often works with small portability fixes:
- Add `midnightbsd` to configure/cmake OS detection when needed (or use compatible FreeBSD version checks where appropriate).
- libc includes OpenBSD `ohash`; libutil differs from FreeBSD. MidnightBSD 4.0.4+ provides `agev_get_age_bracket(const char *username)`.
- Base includes `sqlite3` with a `pkg-config` file. Perl is not in base on 4.0+ (use a package if needed).
- Package management uses `mport` (not FreeBSD `pkg`).
