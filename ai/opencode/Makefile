PORTNAME=	opencode
DISTVERSION=	1.18.5
CATEGORIES=	ai linux
MASTER_SITES=	https://github.com/anomalyco/opencode/releases/download/v${DISTVERSION}/
DISTNAME=	${PORTNAME}-linux-x64-baseline

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenCode AI coding agent CLI (via Linux emulation)
WWW=		https://opencode.ai/

LICENSE=	mit

ONLY_FOR_ARCHS=		amd64
ONLY_FOR_ARCHS_REASON=	Only a Linux x86_64 binary is provided by this port

# The Linux binary is built with Bun and requires glibc 2.34 or later.
USES=		linux:rl9
USE_LINUX=	base devtools elfutils-libs libtool-ltdl

NO_BUILD=	yes

WRKSRC=		${WRKDIR}

SUB_FILES=	opencode-wrapper
SUB_LIST=	PREFIX=${PREFIX}

do-install:
	${MKDIR} ${PREFIX}/lib/linux-opencode
	${INSTALL_SCRIPT} ${WRKSRC}/opencode ${PREFIX}/lib/linux-opencode/
	${INSTALL_SCRIPT} ${WRKDIR}/opencode-wrapper ${PREFIX}/bin/opencode

.include <bsd.port.mk>
