# New ports collection makefile for:    libgnomemm
# Date created:         22 May 2003
# Whom:                 Alexander Nedotsukov <bland@mail.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/libgnomemm/Makefile,v 1.18 2007/05/19 20:27:01 flz Exp $
#

PORTNAME=	libgnomemm
PORTVERSION=	2.0.1
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	gtkmm
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for libgnome library
LICENSE=	lgpl

LIB_DEPENDS=	gtkmm-2.0:${PORTSDIR}/x11-toolkits/gtkmm20
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool:15
USE_X_PREFIX=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack libgnome
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes
CONFIGURE_ARGS=	--enable-static

.include <bsd.port.mk>
