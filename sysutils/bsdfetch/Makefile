PORTNAME=	bsdfetch
PORTVERSION=	1.0.4
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple utility to display system-based information
WWW=		https://github.com/jhx0/bsdfetch

LICENSE=	iscl

USE_GITHUB=	yes
GH_ACCOUNT=	jhx0
GH_TAGNAME=	b1e9d2a

PLIST_FILES+=	bin/bsdfetch

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bsdfetch ${PREFIX}/bin

.include <bsd.port.mk>
