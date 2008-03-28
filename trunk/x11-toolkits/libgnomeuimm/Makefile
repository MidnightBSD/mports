# New ports collection makefile for:    libgnomeuimm
# Date created:         22 May 2003
# Whom:                 Alexander Nedotsukov <bland@mail.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/libgnomeuimm/Makefile,v 1.17 2007/10/04 06:27:13 edwin Exp $
#

PORTNAME=	libgnomeuimm
PORTVERSION=	2.0.0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	gtkmm
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for libgnomeui library
LICENSE=	lgpl

LIB_DEPENDS=	gnomemm-2.0:${PORTSDIR}/x11/libgnomemm \
		gnomecanvasmm-2.0:${PORTSDIR}/graphics/libgnomecanvasmm \
		gconfmm-2.0:${PORTSDIR}/devel/gconfmm \
		glademm-2.0:${PORTSDIR}/devel/libglademm
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_X_PREFIX=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack libgnomeui
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static

.include <bsd.port.mk>
