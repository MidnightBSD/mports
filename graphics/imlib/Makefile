# $MidnightBSD: mports/graphics/imlib/Makefile,v 1.11 2011/02/02 21:04:18 laffer1 Exp $

PORTNAME=	imlib
PORTVERSION=	1.9.15
PORTREVISION=	9
CATEGORIES=	graphics
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphic library for enlightenment package
LICENSE=	gpl2

LIB_DEPENDS=	png.6:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff \
		ungif.5:${PORTSDIR}/graphics/libungif

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_XORG=	sm xext x11
USE_GMAKE=	yes
USE_GNOME=	gtk12 gnomehack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc/imlib --disable-modules
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib"
CPPFLAGS+=	-I${LOCALBASE}/include

MAN1=		imlib-config.1 imlib_config.1

pre-configure:
	@${REINPLACE_CMD} -e "s|10:15:9|5:0:0|" ${WRKSRC}/*/Makefile.in
	@${REINPLACE_CMD} -e "s|glib-config|${GLIB_CONFIG}|" ${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s|@SUPPORT_LIBS@|-L${LOCALBASE}/lib @SUPPORT_LIBS@|" ${WRKSRC}/imlib-config.in

.include <bsd.port.mk>
