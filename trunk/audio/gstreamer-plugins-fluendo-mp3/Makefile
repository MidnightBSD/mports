# New ports collection makefile for:	gstreamer-plugins-fluendo-mp3
# Date created:		2007-02-25
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/audio/gstreamer-plugins-fluendo-mp3/Makefile,v 1.1 2007/12/06 05:11:11 laffer1 Exp $
# $FreeBSD: ports/audio/gstreamer-plugins-fluendo-mp3/Makefile,v 1.4 2007/07/05 12:21:06 ahze Exp $
#

PORTNAME=	gstreamer-plugins-fluendo-mp3
PORTVERSION=	0.10.6
CATEGORIES=	audio
MASTER_SITES=	http://core.fluendo.com/gstreamer/src/gst-fluendo-mp3/
DISTNAME=	gst-fluendo-mp3-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mp3 gstreamer plugin from fluendo
LICENSE=	mit

CFLAGS:=	${CFLAGS} -O2
USE_GSTREAMER=	yes
GNU_CONFIGURE=	yes
PLIST_FILES=	lib/gstreamer-0.10/libgstflump3dec.a \
		lib/gstreamer-0.10/libgstflump3dec.la \
		lib/gstreamer-0.10/libgstflump3dec.so

.include <bsd.port.mk>
