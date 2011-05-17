# $MidnightBSD: mports/devel/xorg-macros/Makefile,v 1.1 2009/03/14 22:28:53 laffer1 Exp $

PORTNAME=	xorg-macros
PORTVERSION=	1.11.0
CATEGORIES=	devel x11
DISTNAME=	util-macros-$(PORTVERSION)

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org development aclocal macros
LICENSE=	unknown

XORG_CAT=	util

MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"

PLIST_FILES=	share/aclocal/xorg-macros.m4 \
		libdata/pkgconfig/xorg-macros.pc \
		share/util-macros/INSTALL

PLIST_DIRS=	share/util-macros

.include <bsd.port.mk>
