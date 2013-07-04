# $MidnightBSD: mports/multimedia/cheese/Makefile,v 1.1 2010/03/01 01:57:32 laffer1 Exp $

PORTNAME=	cheese
PORTVERSION=	2.32.0
PORTREVISION=	0
CATEGORIES=	multimedia gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Photobooth-inspired app for taking pictures and videos from webcam
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/include/linux/videodev.h:${PORTSDIR}/multimedia/v4l_compat
LIB_DEPENDS=	canberra-gtk.0:${PORTSDIR}/audio/libcanberra \
		hal.1:${PORTSDIR}/sysutils/hal

USE_XORG=	xxf86vm
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomeprefix intlhack evolutiondataserver librsvg2 \
		gnomedocutils gnomedesktop
USE_GETTEXT=	yes
USE_GSTREAMER=	good v4l2
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

DOCS=		AUTHORS COPYING ChangeLog NEWS README
GCONF_SCHEMAS=	cheese.schemas

post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
