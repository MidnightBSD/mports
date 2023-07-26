PORTNAME=	bsdfetch
PORTVERSION=	1.1.2
DISTVERSIONPREFIX=release-
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple utility to display system-based information
WWW=		https://github.com/jhx0/bsdfetch

LICENSE=	iscl

USE_GITHUB=	yes
GH_ACCOUNT=	jhx0

PLIST_FILES+=	bin/bsdfetch

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bsdfetch ${PREFIX}/bin

.include <bsd.port.mk>
