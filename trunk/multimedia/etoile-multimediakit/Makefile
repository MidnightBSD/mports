# New ports collection makefile for:    etoile-multimediakit
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/multimedia/etoile-multimediakit/Makefile,v 1.3 2007/10/27 04:07:31 laffer1 Exp $
# $FreeBSD: ports/multimedia/etoile-multimediakit/Makefile,v 1.6 2007/03/04 21:22:27 dinoex Exp $
#

PORTNAME=	multimediakit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	multimedia gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common backend engine to play multimedia stream

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_APPS+=	Mplayer:${GNUSTEP_MPLAYER_PORT}
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_XLIB=	yes

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/MultimediaKit
ADDITIONAL_OBJCFLAGS+=	-I${X11BASE}/include
ADDITIONAL_LDFLAGS+=	-L${X11BASE}/lib

GNUSTEP_MPLAYER_PORT?=	multimedia/gnustep-mplayer

.include <bsd.port.mk>
