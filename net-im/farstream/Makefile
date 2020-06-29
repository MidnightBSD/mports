PORTNAME=	farstream
PORTVERSION=	0.2.8
CATEGORIES=	net-im devel
MASTER_SITES=	http://freedesktop.org/software/farstream/releases/farstream/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of GStreamer modules and libraries for videoconferencing

LICENSE=	lgpl2.1

LIB_DEPENDS=	libnice.so:net-im/libnice
RUN_DEPENDS=	libnice-gst1>=0:net-im/libnice-gst1

USE_LDCONFIG=	yes
USES=		gettext libtool gmake pathfix pkgconfig python
USE_GNOME=	glib20 introspection:build
USE_GSTREAMER1=	good bad

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in -exec ${REINPLACE_CMD} \
		'/foreach/s/\\#include/#include/' {} +

.include <bsd.port.mk>
