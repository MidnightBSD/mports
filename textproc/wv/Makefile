PORTNAME=	wv
PORTVERSION=	1.2.9
PORTREVISION=	8
CATEGORIES=	textproc
MASTER_SITES=	http://www.abisource.com/downloads/wv/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and executables to access Microsoft Word files
WWW=		https://wvware.sourceforge.net/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libpng.so:graphics/png \
		libwmf.so:graphics/libwmf

USES=		gmake gnome jpeg pkgconfig libtool localbase xorg
USE_GNOME=	libgsf
USE_XORG=	x11
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MKDIR_P="${MKDIR}"
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--with-png=${LOCALBASE} \
		--with-libwmf=${LOCALBASE}
MAKEFILE=	GNUmakefile
MAKE_ARGS+=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"
MAKE_ARGS+=	INSTALL_STRIP_FLAG="${STRIP}"
USE_LDCONFIG=	yes

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

.include <bsd.port.mk>
