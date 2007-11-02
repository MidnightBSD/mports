# New ports collection makefile for:    gnustep
# Date created:         03 October 1998
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/devel/gnustep/Makefile,v 1.3 2007/11/01 22:03:48 laffer1 Exp $ 
# $FreeBSD: ports/devel/gnustep/Makefile,v 1.62 2006/08/31 05:35:32 dinoex Exp $
#

PORTNAME=	gnustep
PORTVERSION=	1.13.0
PORTREVISION=	1
CATEGORIES=	devel lang gnustep
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Objective-C libraries based on the OpenStep standard

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
