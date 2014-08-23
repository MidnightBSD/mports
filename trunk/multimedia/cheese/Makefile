# $MidnightBSD$

PORTNAME=	cheese
PORTVERSION=	2.32.0
PORTREVISION=	1
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
USE_GNOME=	gnomehack gnomeprefix intlhack evolutiondataserver librsvg2 \
		gnomedocutils gnomedesktop
USES=		gettext gmake pkgconfig
USE_GSTREAMER=	gconf good ogg theora v4l2 vorbis
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

DOCS=		AUTHORS COPYING ChangeLog NEWS README
GCONF_SCHEMAS=	cheese.schemas

post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
