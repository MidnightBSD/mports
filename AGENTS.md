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
- `bmake fake && bmake makeplist — this generates a gen-plist file in the port directory` — review and trim the result; do not include directories owned by other ports.
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

## USES extensions

`USES` is a space-separated list of extension keywords in a port's `Makefile`. Each keyword maps to a file in `Mk/extensions/<keyword>.mk`, which injects build dependencies, environment variables, and make targets automatically.

```makefile
USES=   cmake python:3.11+ ssl
```

Multiple arguments to a single extension are comma-separated after a colon:

```makefile
USES=   python:3.10+,run    # python 3.10 or later, run dependency only
USES=   go:modules,1.21+    # Go modules mode, minimum Go 1.21
```

To understand what an extension does and what arguments it accepts, read the header comment of the corresponding file, e.g. `Mk/extensions/cmake.mk`.

Commonly used extensions:

| USES keyword    | Purpose                                                               |
|-----------------|-----------------------------------------------------------------------|
| `gmake`         | Use GNU make (`gmake`) as the build tool                             |
| `cmake`         | CMake-based build; args: `indirect`, `insource`, `noninja`, `testing`|
| `meson`         | Meson-based build; arg: `muon` to use muon instead                   |
| `ninja`         | Ninja build system; args: `build`, `make`, `run`, `samurai`          |
| `python`        | Python interpreter/module support; takes version-spec and phase args |
| `perl5`         | Perl 5 interpreter support                                            |
| `go`            | Go toolchain; args: `modules`, `N.NN+`, `run`, `no_targets`          |
| `cargo`         | Rust/Cargo build support                                              |
| `ssl`           | SSL/TLS library dependency; args: `build`, `run`                     |
| `pkgconfig`     | pkg-config dependency; args: `build` (default), `run`, `both`        |
| `iconv`         | iconv library; args: `lib` (default), `build`, `patch`, `wchar_t`   |
| `libtool`       | Update libtool scripts; args: `keepla`, `build`                      |
| `compiler`      | Select compiler standard; args: `c11`, `c17`, `c++11-lang`, etc.     |
| `lua`           | Lua interpreter; version specified as `52`, `53`, `54` etc.          |
| `mysql`         | MySQL client/server; args: `client` (default), `server`, `<version>` |
| `pgsql`         | PostgreSQL; takes version range (e.g. `9.5+`, `9.3-9.6`)            |
| `shebangfix`    | Fix `#!` interpreter paths in scripts                                 |
| `dos2unix`      | Convert CRLF line endings to Unix                                     |
| `fonts`         | Font installation support; args: `fc`, `fontsdir`, `fcfontsdir`      |
| `xorg`          | X.Org library dependencies (also requires `USE_XORG=<components>`)   |
| `autoreconf`    | Run `autoreconf` before configure                                     |

The full list of available extensions is in `Mk/extensions/`. When adding a new `USES` keyword, verify the extension file exists before using it.

## Licenses

The `LICENSE` field is mandatory for all ports. To find a valid license identifier:
- Run `bmake license-list` from any port directory, or
- Review `Mk/components/licenses.db.mk` for the full list of recognized identifiers.

Common variables:

| Variable             | Purpose                                                                          |
|----------------------|----------------------------------------------------------------------------------|
| `LICENSE`            | One or more license identifiers (required)                                       |
| `LICENSE_COMB`       | `dual` (any one) or `multi` (all required); omit for a single license            |
| `LICENSE_FILE`       | Path to the license file for the port (mutually exclusive with `LICENSE_TEXT`)   |
| `LICENSE_TEXT`       | Inline license text; generates a file at build time (custom licenses only)       |
| `LICENSE_DISTFILES`  | Distfiles this license covers; defaults to all distfiles                         |
| `LICENSE_NAME`       | Human-readable name (required for custom/unknown licenses)                       |
| `LICENSE_PERMS`      | Space-separated permissions (required for custom licenses; see below)            |
| `LICENSE_GROUPS`     | License group membership (optional; e.g. `FSF GPL OSI COPYFREE`)                |

For dual/multi licenses each variable above also has a per-license form: `LICENSE_FILE_<lic>`, `LICENSE_TEXT_<lic>`, `LICENSE_NAME_<lic>`, `LICENSE_PERMS_<lic>`, `LICENSE_GROUPS_<lic>`, `LICENSE_DISTFILES_<lic>`.

Valid `LICENSE_PERMS` components (from `Mk/components/licenses.mk`):

| Component     | Meaning                                  |
|---------------|------------------------------------------|
| `dist-mirror` | Redistribution of source distfiles ok   |
| `dist-sell`   | Selling source distfiles ok             |
| `pkg-mirror`  | Redistribution of binary packages ok    |
| `pkg-sell`    | Selling binary packages ok              |
| `auto-accept` | License can be accepted without prompting the user |
| `none`        | No permissions (e.g. `NONE` or `unknown`) |

Prefix any component with `no-` to explicitly deny it (e.g. `no-pkg-sell`).

Useful make targets (from `Mk/components/licenses.mk`):

| Target              | Purpose                                                    |
|---------------------|------------------------------------------------------------|
| `bmake license-list`  | Print all recognized license identifiers                 |
| `bmake check-license` | Validate the port's license configuration; exits on error|
| `bmake debug-license` | Show full permission and group details for the license   |
| `bmake ask-license`   | Trigger the interactive license acceptance flow          |

If a port's license is not in the standard list, define a custom license using `LICENSE_NAME`, `LICENSE_PERMS`, and either `LICENSE_FILE` or `LICENSE_TEXT` rather than using `unknown`. Run `bmake check-license` after any license change to catch configuration errors early.

When updating an existing port, always verify the license is still accurate — upstream projects sometimes relicense. If a license change is detected, **do not update the `LICENSE` field automatically**; present the old and new values to the user and ask them to confirm before making the change.

## Core framework: Mk/bsd.mport.mk

`Mk/bsd.mport.mk` is the central file of the mports build system, included by every port's `Makefile` (directly or via `Mk/bsd.port.subdir.mk`). It defines all standard targets, variables, and the build pipeline. It is derived from FreeBSD's `bsd.port.mk` and adapted for MidnightBSD.

**Do not modify `Mk/bsd.mport.mk` without consulting the maintainer** (`luke@MidnightBSD.org`). The file carries a strong warning against unauthorized changes.

Key things defined in `bsd.mport.mk`:

| Item | Description |
|------|-------------|
| `PORTSDIR` | Root of the ports tree (`/usr/mports`) |
| `FAKE_DESTDIR` | Staging directory root for `bmake fake` |
| `TRUE_PREFIX` | Runtime install prefix (usually `/usr/local`) |
| `WRKDIR` | Per-port working directory for extracted sources |
| `LOCALBASE` | Base for installed software (`/usr/local`) |
| `DISTDIR` | Where distfiles are downloaded (`Distfiles/`) |

Standard build pipeline targets (in order):

```
fetch → checksum → extract → patch → configure → build → fake → package
```

Each stage has `pre-`, `do-`, and `post-` hook targets that ports can override (e.g. `post-patch`, `pre-configure`, `do-install`).

`bsd.mport.mk` also orchestrates all includes, pulling in:
- `Mk/components/` — options, licenses, fake targets, sanity checks, sites, default versions
- `Mk/extensions/` — `USES` keyword implementations
- `Mk/bsd.destdir.mk` — `DESTDIR`/chroot support
- `Mk/bsd.gcc.mk` — GCC toolchain handling
- `Masterdir/Makefile.inc`, `Makefile.local` — per-category and per-port overrides

When debugging unexpected build behavior, `bsd.mport.mk` is the authoritative reference for how targets and variables interact.

## Porting software

MidnightBSD 4.0 is based on FreeBSD 13-stable; MidnightBSD 3.2 is based on FreeBSD 12.4. FreeBSD-oriented software often works with small portability fixes:
- Add `midnightbsd` to configure/cmake OS detection when needed (or use compatible FreeBSD version checks where appropriate).
- libc includes OpenBSD `ohash`; libutil differs from FreeBSD. MidnightBSD 4.0.4+ provides `agev_get_age_bracket(const char *username)`.
- Base includes `sqlite3` with a `pkg-config` file. Perl is not in base on 4.0+ (use a package if needed).
- Package management uses `mport` (not FreeBSD `pkg`). Do not reference `pkg` in user-facing instructions, scripts, or documentation; use `mport install` instead.
