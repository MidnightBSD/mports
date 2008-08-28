# New ports collection makefile for:	gnomeaudio2
# Date created:				10 July 2003
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/audio/gnome-audio/Makefile,v 1.3 2008/03/26 01:52:36 ctriv Exp $
# $FreeBSD: ports/audio/gnome-audio/Makefile,v 1.26 2007/05/19 19:58:44 flz Exp $
#   $MCom: ports/audio/gnome-audio/Makefile,v 1.3 2006/07/22 19:49:20 mezz Exp $
#

PORTNAME=	gnome-audio
PORTVERSION=	2.22.2
PORTREVISION=	0
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound files for use with GNOME 2
LICENSE=	unknown

USE_BZIP2=	yes
USE_XLIB=	yes
NO_BUILD=	yes
USE_GNOME=	gnomehack gnomeprefix gnomehier

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/share|${PREFIX}/share|' \
		${WRKSRC}/sounds/Makefile

.include <bsd.port.mk>
