# Created by: Michael Johnson <ahze@FreeBSD.org>
# $FreeBSD: head/multimedia/gstreamer1-plugins-gnonlin/Makefile 374804 2014-12-16 13:35:01Z kwm $

PORTNAME=	gstreamer1-plugins-gnonlin
PORTVERSION=	1.4.0
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gnonlin/
DISTNAME=	gnonlin-${PORTVERSION}

MAINTAINER=	multimedia@FreeBSD.org
COMMENT=	Gstreamer lib for writing non-linear audio and video

USES=		libtool pkgconfig python:3,build tar:xz
GNU_CONFIGURE=	yes
USE_GSTREAMER1=	good
INSTALL_TARGET=	install-strip

PLIST_FILES=	lib/gstreamer-1.0/libgnl.so

.include <bsd.port.mk>
