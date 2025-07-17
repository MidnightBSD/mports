PORTNAME=	libcangjie
PORTVERSION=	1.3
PORTREVISION=	2
DISTVERSIONPREFIX=	v
CATEGORIES=	chinese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library implementing the Cangjie input method
WWW=		https://github.com/Cangjians/libcangjie

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libsqlite3.so:databases/sqlite3		\
		libfreetype.so:print/freetype2          \
		libdbus-1.so:devel/dbus

USES=		autoreconf gmake libtool localbase pkgconfig sqlite xorg
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_XORG=	xi

USE_GITHUB=	yes
GH_ACCOUNT=	Cangjians

post-install:
	@(${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/*.so)

.include <bsd.port.mk>
