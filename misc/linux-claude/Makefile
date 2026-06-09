PORTNAME=	linux-claude
DISTVERSION=	2.1.170
CATEGORIES=	misc linux
MASTER_SITES=	https://registry.npmjs.org/@anthropic-ai/claude-code-linux-x64/-/
DISTNAME=	claude-code-linux-x64-${DISTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Anthropic Claude AI assistant CLI (via Linux emulation)
WWW=		https://claude.ai/code

LICENSE=	CLAUDE_CODE
LICENSE_NAME=	Anthropic Claude Code License
LICENSE_FILE=	${WRKSRC}/LICENSE.md
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept

ONLY_FOR_ARCHS=		amd64
ONLY_FOR_ARCHS_REASON=	Only Linux x86_64 binary is provided upstream

# Requires Rocky Linux 9 base for glibc 2.34+
USES=		linux:rl9
USE_LINUX=	base devtools elfutils-libs libtool-ltdl

NO_BUILD=	yes

# npm tarballs extract into a "package/" subdirectory
WRKSRC=		${WRKDIR}/package

SUB_FILES=	claude
SUB_LIST=	PREFIX=${PREFIX}

do-install:
	${MKDIR} ${PREFIX}/lib/linux-claude
	${CP} ${WRKSRC}/package.json ${PREFIX}/lib/linux-claude/
	${INSTALL_DATA} ${WRKSRC}/claude ${PREFIX}/lib/linux-claude/claude
	${CHMOD} 555 ${PREFIX}/lib/linux-claude/claude
#	brandelf -t Linux ${PREFIX}/lib/linux-claude/claude
	${INSTALL_SCRIPT} ${WRKDIR}/claude ${PREFIX}/bin/claude

.include <bsd.port.mk>
