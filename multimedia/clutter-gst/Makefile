PORTNAME=	clutter-gst
PORTVERSION=	2.0.18
CATEGORIES=	multimedia
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clutter GStreamer integration

LICENSE=	lgpl2.1

LIB_DEPENDS=	libclutter-1.0.so:graphics/clutter

PORTSCOUT=	ignore:1

USES=		gl gmake gnome libtool localbase pathfix \
		pkgconfig tar:xz xorg
USE_GNOME=	introspection gnomeprefix
GNU_CONFIGURE=	yes
USE_GL=		gl
USE_GSTREAMER1=	yes
USE_XORG=	x11
USE_LDCONFIG=	yes
MAKE_ENV=	XDG_CACHE_HOME=${WRKDIR}

LDFLAGS+=	-lpthread
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
