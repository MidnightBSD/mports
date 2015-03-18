# $MidnightBSD$

PORTNAME=	imlib
PORTVERSION=	1.9.15
PORTREVISION=	12
CATEGORIES=	graphics
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphic library for enlightenment package

LICENSE=	gpl2

LIB_DEPENDS=	png:${PORTSDIR}/graphics/png \
		tiff:${PORTSDIR}/graphics/tiff \
		gif:${PORTSDIR}/graphics/giflib

USES=		libtool tar:bzip2 gmake
USE_XORG=	sm xext x11
USE_GMAKE=	yes
USE_GNOME=	gtk12
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc/imlib --disable-modules
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib"
CPPFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/libpng15

MAN1=		imlib-config.1 imlib_config.1

pre-configure:
	@${REINPLACE_CMD} -e "s|10:15:9|5:0:0|" ${WRKSRC}/*/Makefile.in
	@${REINPLACE_CMD} -e "s|glib-config|${GLIB_CONFIG}|" ${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s|@SUPPORT_LIBS@|-L${LOCALBASE}/lib @SUPPORT_LIBS@|" ${WRKSRC}/imlib-config.in

.include <bsd.port.mk>
