# New ports collection makefile for:	libcddb
# Date created:		Mon Mar  1 00:48:58 EST 2004
# Whom:			Michael Johnson <ahze@ahze.net>
#
# $MidnightBSD: mports/audio/libcddb/Makefile,v 1.4 2009/12/31 21:05:40 laffer1 Exp $
# $FreeBSD: ports/audio/libcddb/Makefile,v 1.16 2006/06/09 18:00:28 ahze Exp $
#

PORTNAME=	libcddb
PORTVERSION=	1.3.0
CATEGORIES=	audio
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library to access data on a CDDB server
LICENSE=	lgpl

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	 gnomehack pkgconfig
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--without-cdio
CONFIGURE_ENV=	CPPFLAGS="-DICONV_CONST=\"const\""

.include <bsd.port.mk>
