# New ports collection makefile for:	gstreamer-plugins-pango
# Date created:			23 Nov 2007
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

CATEGORIES=	x11-toolkits

COMMENT=	Gstreamer pango textoverlay plugin
LICENSE=	agg

GST_PLUGIN=	pango

LIB_DEPENDS+=	libpango-1.0.so:x11-toolkits/pango \
		libcairo.so:graphics/cairo

MASTERDIR=	${.CURDIR}/../../multimedia/gstreamer-plugins

.include "${MASTERDIR}/Makefile"
