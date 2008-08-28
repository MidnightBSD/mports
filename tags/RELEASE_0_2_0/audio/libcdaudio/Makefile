# New ports collection makefile for:	libcdaudio
# Date created:		01 June 1999
# Whom:			Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/audio/libcdaudio/Makefile,v 1.1 2007/04/07 19:01:22 laffer1 Exp $
# $FreeBSD: ports/audio/libcdaudio/Makefile,v 1.26 2007/01/28 09:07:34 kris Exp $
#

PORTNAME=	libcdaudio
PORTVERSION=	0.99.12p2
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for playing audio CDs
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=  yes
INSTALLS_SHLIB=	yes

.include <bsd.port.mk>
