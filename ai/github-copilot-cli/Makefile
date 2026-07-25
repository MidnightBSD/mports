PORTNAME=	github-copilot-cli
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.72
CATEGORIES=	ai linux
MASTER_SITES=	https://github.com/github/copilot-cli/releases/download/${DISTVERSIONPREFIX}${DISTVERSION}/
DISTFILES=	copilot-linux-x64.tar.gz
DIST_SUBDIR=	${PORTNAME}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CLI for GitHub Copilot
WWW=		https://github.com/github/copilot-cli

LICENSE=	GITHUB_COPILOT_CLI
LICENSE_NAME=	GitHub Copilot CLI License
# The binary distfile ships no license file; the terms are published at
# https://github.com/github/copilot-cli/blob/main/LICENSE.md
LICENSE_TEXT=	GitHub Copilot CLI is licensed under the GitHub Copilot CLI \
		License, available at \
		https://github.com/github/copilot-cli/blob/main/LICENSE.md
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept

ONLY_FOR_ARCHS=		amd64
ONLY_FOR_ARCHS_REASON=	is a Linux binary with a limited platform support

USES=		linux:rl9 python:build
USE_LINUX=	base

NO_BUILD=	yes
NO_WRKSUBDIR=	yes

PLIST_FILES=	bin/copilot

find-new-version:
	@TAB=$$(printf '\t'); \
	new_ver=$$(${PORTSDIR}/Tools/scripts/github-get-latest-version.sh github copilot-cli | ${SED} 's/^v//'); \
	current_ver=$$(make -V DISTVERSION); \
	if [ "$$new_ver" != "$$current_ver" ]; then \
		${SED} -i '' "s/^DISTVERSION=.*/DISTVERSION=$${TAB}$$new_ver/" ${.CURDIR}/Makefile; \
		echo "=> New version available: $$current_ver -> $$new_ver"; \
	else \
		echo "=> No new version available (current: $$current_ver)"; \
	fi

.include <bsd.port.pre.mk>

EXTRACT_ONLY=	copilot-linux-x64.tar.gz

# Upstream ships a single-file Node SEA whose program header table sits ~45MB
# into the binary.  The kernel image activator only reads program headers from
# the first page (sys/kern/imgact_elf.c), so exec(2) fails with ENOEXEC.  Move
# the table back into the first page before installing.
post-extract:
	@${PYTHON_CMD} ${FILESDIR}/relocate-phdrs.py ${WRKSRC}/copilot

# INSTALL_SCRIPT, not INSTALL_PROGRAM: the latter passes -s to install(1),
# and stripping the prebuilt Linux binary with the native strip(1) breaks it.
do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/copilot ${PREFIX}/bin/copilot

.include <bsd.port.post.mk>
