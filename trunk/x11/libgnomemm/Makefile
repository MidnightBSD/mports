# New ports collection makefile for:    libgnomemm
# Date created:         22 May 2003
# Whom:                 Alexander Nedotsukov <bland@mail.ru>
#
# $MidnightBSD: mports/x11/libgnomemm/Makefile,v 1.4 2009/12/29 00:14:23 laffer1 Exp $
# $FreeBSD: ports/x11/libgnomemm/Makefile,v 1.18 2007/05/19 20:27:01 flz Exp $
#

PORTNAME=	libgnomemm
PORTVERSION=	2.0.1
PORTREVISION=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	SF/gtkmm/OldFiles
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for libgnome library
LICENSE=	lgpl

LIB_DEPENDS=	gtkmm-2.0:${PORTSDIR}/x11-toolkits/gtkmm20
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_GNOME=	gnomehack libgnome
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static

.include <bsd.port.mk>
