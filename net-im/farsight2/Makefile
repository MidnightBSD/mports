# $MidnightBSD$

PORTNAME=	farsight2
PORTVERSION=	0.0.31
PORTREVISION=	4
CATEGORIES=	net-im devel
MASTER_SITES=	http://www.freedesktop.org/software/farstream/releases/farsight2/ \
		http://miwibox.org/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of GStreamer modules and libraries for videoconferencing

LICENSE=	lgpl

BUILD_DEPENDS=	py-gobject>=0:devel/py-gobject@${PY_FLAVOR}
LIB_DEPENDS=	libnice.so:net-im/libnice
RUN_DEPENDS=	libnice-gst010>=0:net-im/libnice-gst010

USES=		gettext libtool gmake pathfix pkgconfig python:2.7
USE_LDCONFIG=	yes
USE_GNOME=	glib20
USE_GSTREAMER=	core good bad python
GNU_CONFIGURE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
