# New ports collection makefile for:    libglademm
# Date created:         22 May 2003
# Whom:                 Alexander Nedotsukov <bland@mail.ru>
#
# $MidnightBSD: mports/devel/libglademm/Makefile,v 1.2 2008/09/21 19:54:09 laffer1 Exp $
# $FreeBSD: ports/devel/libglademm/Makefile,v 1.19 2007/05/19 20:03:07 flz Exp $
#

PORTNAME=	libglademm
PORTVERSION=	2.1.3
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	gtkmm
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for libglade2 library
LICENSE=	lgpl

LIB_DEPENDS=	gtkmm-2.0:${PORTSDIR}/x11-toolkits/gtkmm20
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_XORG=	x11 sm
USE_GMAKE=	yes
USE_GNOME=	gnomehack libglade2
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/examples//' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
