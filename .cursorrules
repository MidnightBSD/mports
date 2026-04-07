# MidnightBSD Ports Collection - AI Hints

This repository contains the MidnightBSD Ports Collection (mports), which is a package management system similar to FreeBSD ports. It allows building and installing third-party software on MidnightBSD.

## Key Project Details
- **Operating System**: MidnightBSD (a BSD derivative).
- **Build System**: Uses BSD make (bmake) exclusively. All Makefiles use bmake syntax, not GNU make.
- **Structure**:
  - Top-level categories (e.g., `devel/`, `www/`) contain individual port directories.
  - Each port has a `Makefile` and often additional files like `pkg-descr`, `pkg-plist`.
  - Core build logic is in `Mk/` (e.g., `bsd.mport.mk`, `bsd.port.subdir.mk`).
  - `Tools/` contains Magus, the package build cluster software for automated package creation and testing.
- **Variables**: Common variables include `OSREL` (OS release, e.g., 4.0), `OPSYS` (MidnightBSD), `ARCH` (architecture).
- **Commands**: Use `make` (bmake) for building ports, e.g., `make install` in a port directory.

## AI Agent Guidelines
- When suggesting code changes, ensure compatibility with bmake syntax (e.g., use `.if` instead of `if`, `:C` for string substitution).
- Avoid GNU make extensions unless explicitly noted.
- Reference MidnightBSD documentation: https://www.midnightbsd.org/
- Ports are self-contained; changes to one port shouldn't affect others unless in shared `Mk/` files.
- Test suggestions with `make -V <variable>` or `make index` to validate.

For more info, see the README.md or https://github.com/MidnightBSD/mports.

