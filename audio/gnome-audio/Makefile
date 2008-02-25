# New ports collection makefile for:	gnomeaudio2
# Date created:				10 July 2003
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/audio/gnome-audio/Makefile,v 1.1 2007/10/23 21:11:36 laffer1 Exp $
# $FreeBSD: ports/audio/gnome-audio/Makefile,v 1.26 2007/05/19 19:58:44 flz Exp $
#   $MCom: ports/audio/gnome-audio/Makefile,v 1.3 2006/07/22 19:49:20 mezz Exp $
#

PORTNAME=	gnome-audio
PORTVERSION=	2.0.0
PORTREVISION=	1
CATEGORIES=	audio gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/gnome-audio/2.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound files for use with GNOME 2

USE_BZIP2=	yes
USE_XLIB=	yes
NO_BUILD=	yes
USE_GNOME=	gnomehack gnomeprefix gnomehier
WRKSRC=		${WRKDIR}/${DISTNAME}/sounds

.include <bsd.port.mk>
