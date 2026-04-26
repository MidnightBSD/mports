# AGENTS.md

Instructions for coding agents working in this repository.

If an AI-assisted commit is created, include the appropriate `AI-Assisted-by:` trailer for the agent actually used. Also, use git commit -s to signoff on commits.

## Overview

This is the MidnightBSD mports, a collection of ports Makefiles and patches to
build applications on the MidnightBSD operating system. 

All software in this repository must support the latest stable release and the latest development version of MidnightBSD.

## Building ports

By default, MidnightBSD uses "bmake" or BSD make to build software.  Ports should prefer bmake unless the software requires another build tool such as gmake, cmake, ninja, maven, gradle, etc. 

Targets inside ports include:
fetch - downloads source code or binaries for the build
patch - applies patches
fake - stages the installation into the ${FAKE_DESTDIR}
package - builds packages
deinstall - uninstalls the software
reinstall - reinstalls the software
install - installs the software for the first time
test - runs tests for ports that have them.  Not all do.  If NO_TEST is set, tests will not run.  This is needed with unreliable test harness.

When developing a port, always compile it and run the fake target to confirm it can be staged properly.  Also use the package target to make sure a package can be installed.  Run tests if present and if there are failures, ask if they should be excluded or if they are failures that must be addressed. 

do-install, fake-install will include the FAKE_DESTDIR within PREFIX.  For targets starting with do-install- or do-fake- they will not include FAKE_DESTDIR as part of PREFIX and will need it applied.  FAKE_DESTDIR is similar to STAGEDIR in FreeBSD ports.

## Porting software

MidnightBSD 4.0 is based on FreeBSD 13-stable.  MidnightBSD 3.2 is based on FreeBSD 12.4.  Often, software written for FreeBSD will work on MidnightBSD, but may need patches to add midnightbsd to configure scripts or cmake, or possibly impersonation of FreeBSD versions to function.

MidnightBSD has additional features in libc such as OpenBSD's ohash library as well as extra functionality in libutil that may differ from FreeBSD.  MidnightBSD 4.0.4 and higher include age attenstion/verification api  in libutil:
int * agev_get_age_bracket(const char *username);

The MidnightBSD os bundles a system sqlite3 with a pkgconfig file. Versions prior to 4.0 included Perl in the base system, but now requires a package.

MidnightBSD uses mport for package management rather than FreeBSD pkg.  
