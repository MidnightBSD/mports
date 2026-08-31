PORTNAME=	antigravity
DISTVERSION=	1.1.22
CATEGORIES=	ai linux
MASTER_SITES=	https://storage.googleapis.com/antigravity-public/antigravity-cli/${DISTVERSION}-${BUILD_ID}/linux-x64/
DISTNAME=	cli_linux_x64
DIST_SUBDIR=	antigravity

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google Antigravity agentic coding CLI (via Linux emulation)
WWW=		https://antigravity.google/product/antigravity-cli/

LICENSE=	ANTIGRAVITY
LICENSE_NAME=	Google Antigravity Terms of Service
LICENSE_TEXT=	Google Antigravity is proprietary software.  Use of the Antigravity \
		CLI is governed by the Google Antigravity Terms of Service, \
		available at https://antigravity.google/terms
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept

# Requires Rocky Linux 9 base for glibc 2.34+
USES=		linux:rl9
USE_LINUX=	base

ONLY_FOR_ARCHS=		amd64
ONLY_FOR_ARCHS_REASON=	Only Linux x86_64 binary is provided upstream

# Upstream publishes releases under a build-specific path component.
BUILD_ID=	5711547746615296

NO_BUILD=	yes

# The tarball contains a single flat "antigravity" binary.
NO_WRKSUBDIR=	yes

SUB_FILES=	agy
SUB_LIST=	PREFIX=${PREFIX}

do-install:
	${MKDIR} ${PREFIX}/lib/linux-antigravity
	${INSTALL_SCRIPT} ${WRKSRC}/antigravity ${PREFIX}/lib/linux-antigravity/antigravity
	${INSTALL_SCRIPT} ${WRKDIR}/agy ${PREFIX}/bin/agy

.include <bsd.port.mk>
