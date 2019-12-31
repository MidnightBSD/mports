PORTNAME=	wv
PORTVERSION=	1.2.9
PORTREVISION=	5
CATEGORIES=	textproc
MASTER_SITES=	http://www.abisource.com/downloads/wv/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and executables to access Microsoft Word files

LICENSE=	gpl2

LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libpng.so:graphics/png \
		libwmf.so:graphics/libwmf

USE_GNOME=	libgsf
USE_XORG=	x11
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USES=		gmake jpeg pkgconfig libtool localbase
CONFIGURE_ENV=	MKDIR_P="${MKDIR}"
CONFIGURE_ARGS=	--with-png=${LOCALBASE} \
		--with-libwmf=${LOCALBASE}
MAKEFILE=	GNUmakefile
MAKE_ARGS+=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"
MAKE_ARGS+=	INSTALL_STRIP_FLAG="${STRIP}"
USE_LDCONFIG=	yes

.include <bsd.port.mk>
