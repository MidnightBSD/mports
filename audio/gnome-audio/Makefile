# New ports collection makefile for:	gnomeaudio2
# Date created:				10 July 2003
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/audio/gnome-audio/Makefile,v 1.4 2008/06/01 16:43:18 laffer1 Exp $
# $FreeBSD: ports/audio/gnome-audio/Makefile,v 1.26 2007/05/19 19:58:44 flz Exp $
#   $MCom: ports/audio/gnome-audio/Makefile,v 1.3 2006/07/22 19:49:20 mezz Exp $
#

PORTNAME=	gnome-audio
PORTVERSION=	2.22.2
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound files for use with GNOME 2
LICENSE=	agg
# creative commons 2/3 right now

USE_BZIP2=	yes
NO_BUILD=	yes
USE_GNOME=	gnomehack gnomeprefix gnomehier

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/share|${PREFIX}/share|' \
		${WRKSRC}/sounds/Makefile

.include <bsd.port.mk>
