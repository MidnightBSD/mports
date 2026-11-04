PORTNAME=	pixd
DISTVERSIONPREFIX=v
DISTVERSION=	1.0.0
PORTREVISION=	3
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Visualize binary data in terminal

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c++11-lang gmake
USE_GITHUB=	yes
GH_ACCOUNT=	FireyFly

ALL_TARGET=	pixd

PLIST_FILES=	bin/pixd \
		man/man1/pixd.1.gz

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/pixd ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/pixd.1 ${PREFIX}/man/man1
	@${STRIP_CMD} ${PREFIX}/bin/pixd

.include <bsd.port.mk>
