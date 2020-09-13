PORTNAME=	mkfontscale
PORTVERSION=	1.2.1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Creates an index of scalable font files for X

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfreetype.so:print/freetype2

USES=		xorg xorg-cat:app
USE_XORG=	xorgproto fontenc

PLIST_FILES=	bin/mkfontdir \
		bin/mkfontscale \
		man/man1/mkfontdir.1.gz \
		man/man1/mkfontscale.1.gz

.include <bsd.port.mk>
