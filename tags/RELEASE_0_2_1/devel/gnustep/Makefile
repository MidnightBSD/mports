# New ports collection makefile for:    gnustep
# Date created:         03 October 1998
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/devel/gnustep/Makefile,v 1.7 2007/11/07 20:20:12 ctriv Exp $ 
# $FreeBSD: ports/devel/gnustep/Makefile,v 1.62 2006/08/31 05:35:32 dinoex Exp $
#

PORTNAME=	gnustep
.if defined(WITH_GNUSTEP_DEVEL)
PORTVERSION=	1.15.3
.else
PORTVERSION=	1.14.3
.endif
PORTREVISION=	0
CATEGORIES=	devel lang gnustep
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Objective-C libraries based on the OpenStep standard
LICENSE=	agg
# part gpl3 now

NO_BUILD=	yes
NO_INSTALL=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_GUI=	yes
USE_GNUSTEP_BACK=	yes
.if !defined(WITH_GNUSTEP_SINGLE_BACKEND)
USE_GNUSTEP_XLIB=	yes
USE_GNUSTEP_LIBART=	yes
USE_GNUSTEP_CAIRO=	yes
.endif


.include <bsd.port.mk>
