PORTNAME=	gstreamer1-plugins-sndio
DISTVERSIONPREFIX=	v
DISTVERSION=	1.8.0.1
PORTREVISION=	1
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sndio audio sink and source for GStreamer
WWW=		https://github.com/t6/gstreamer1-plugins-sndio/

LICENSE=	iscl

LIB_DEPENDS=	libsndio.so:audio/sndio

USES=		gnome gstreamer pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	t6
USE_GNOME=	glib20

PLIST_FILES=	lib/gstreamer-1.0/libgstsndio.so

.include <bsd.port.mk>
