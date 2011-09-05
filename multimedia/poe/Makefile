# $MidnightBSD: mports/multimedia/poe/Makefile,v 1.1 2010/01/21 01:58:29 laffer1 Exp $

PORTNAME=	poe
PORTVERSION=	0.5.1
PORTREVISION=	1
CATEGORIES=	multimedia gnustep
MASTER_SITES=	http://www.eskimo.com/~pburns/Poe/files/
DISTNAME=	Poe-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A vorbis comment editor for GNUstep
LICENSE=	gpl2

LIB_DEPENDS+=	vorbis.4:${PORTSDIR}/audio/libvorbis

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

PORTSCOUT=	skipv:0.5.2

.include <bsd.port.mk>
