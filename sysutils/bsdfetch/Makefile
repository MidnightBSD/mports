PORTNAME=	bsdfetch
PORTVERSION=	0.2
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple utility to display system-based information
WWW=		https://github.com/jhx0/bsdfetch			

USE_GITHUB=	yes
GH_ACCOUNT=	jhx0
GH_TAGNAME=	368f5b4f39e757e90e80fb758f05904aba61d6d7

PLIST_FILES+=	bin/bsdfetch

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bsdfetch ${PREFIX}/bin

.include <bsd.port.mk>
