PORTNAME=	xkbprint
PORTVERSION=	1.0.5
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility for printing an XKB keyboard description

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		xorg xorg-cat:app
USE_XORG=	xkbfile x11

PLIST_FILES=	bin/xkbprint share/man/man1/xkbprint.1.gz
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share

.include <bsd.port.mk>
