# New ports collection makefile for:	libmpd
# Date created:		Apr 4 2006
# Whom:			Stepan Zastupov [RedChrom] <redchrom@gmail.com>
#
# $MidnightBSD: mports/audio/libmpd/Makefile,v 1.1 2008/09/26 15:46:06 laffer1 Exp $
# $FreeBSD: ports/audio/libmpd/Makefile,v 1.6 2008/06/06 13:06:51 edwin Exp $
#

PORTNAME=	libmpd
PORTVERSION=	0.15.0
CATEGORIES=	audio
MASTER_SITES=	http://download.sarine.nl/gmpc-0.15.5/ \
		http://download.gna.org/kanicule/freebsd/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstraction around libmpdclient
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GNOME=	pkgconfig glib20 gnomehack
USE_LDCONFIG=	yes

.include <bsd.port.mk>
