PORTNAME=	fonttosfnt
PORTVERSION=	1.2.3
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrap a bitmap font in a sftn wrapper
WWW=		https://www.x.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfreetype.so:print/freetype2

USES=		tar:xz xorg xorg-cat:app
USE_XORG=	xorgproto fontenc

PLIST_FILES=	bin/fonttosfnt share/man/man1/fonttosfnt.1.gz

.include <bsd.port.mk>
