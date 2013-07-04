# New ports collection makefile for:	gstreamer-plugins-mp3
# Date created:		23 Nov 2007
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	gstreamer-plugins
PORTVERSION=	0.10.0
CATEGORIES=	audio
MASTER_SITES=	# empty
PKGNAMESUFFIX=	-mp3
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gstreamer Plugins Mp3 decoder meta-port
LICENSE=	restricted

NO_BUILD=	yes
WANT_GSTREAMER=	yes
OPTIONS=	MAD "Use MAD Mp3" On \
		FLUENDO "Use Fluendo Mp3" Off

.include <bsd.port.pre.mk>

.if !defined(WITH_MAD) && !defined(WITH_FLUENDO)
WITH_MAD=	yes
.endif

.if defined(WITH_MAD)
USE_GSTREAMER+=	mad
.endif

.if defined(WITH_FLUENDO)
USE_GSTREAMER+=	fluendo-mp3
.endif

do-install:

.include <bsd.port.post.mk>
