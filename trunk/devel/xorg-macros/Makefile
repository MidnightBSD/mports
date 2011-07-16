# $MidnightBSD: mports/devel/xorg-macros/Makefile,v 1.2 2011/05/17 03:41:59 laffer1 Exp $

PORTNAME=	xorg-macros
PORTVERSION=	1.11.0
CATEGORIES=	devel x11
DISTNAME=	util-macros-$(PORTVERSION)

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org development aclocal macros
LICENSE=	mit

XORG_CAT=	util

MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"

PLIST_FILES=	share/aclocal/xorg-macros.m4 \
		libdata/pkgconfig/xorg-macros.pc \
		share/util-macros/INSTALL

PLIST_DIRS=	share/util-macros

.include <bsd.port.mk>
