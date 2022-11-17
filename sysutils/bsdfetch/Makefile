PORTNAME=	bsdfetch
PORTVERSION=	0.6
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple utility to display system-based information
WWW=		https://github.com/jhx0/bsdfetch

LICENSE=	iscl

USE_GITHUB=	yes
GH_ACCOUNT=	jhx0
GH_TAGNAME=	874c7d803b4a82808f00987e101354123ebc5c76

PLIST_FILES+=	bin/bsdfetch

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bsdfetch ${PREFIX}/bin

.include <bsd.port.mk>
