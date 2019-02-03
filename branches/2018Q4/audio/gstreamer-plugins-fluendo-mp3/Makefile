# $MidnightBSD$
# $FreeBSD: ports/audio/gstreamer-plugins-fluendo-mp3/Makefile,v 1.4 2007/07/05 12:21:06 ahze Exp $

PORTNAME=	gstreamer-plugins-fluendo-mp3
PORTVERSION=	0.10.20
CATEGORIES=	audio
MASTER_SITES=	http://core.fluendo.com/gstreamer/src/gst-fluendo-mp3/
DISTNAME=	gst-fluendo-mp3-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mp3 gstreamer plugin from fluendo

LICENSE=	mit

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		libtool pkgconfig
USE_GSTREAMER=	yes
PLIST_FILES=	lib/gstreamer-0.10/libgstflump3dec.so

.include <bsd.port.mk>
