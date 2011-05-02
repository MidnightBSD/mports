# $MidnightBSD: mports/x11/libSM/Makefile,v 1.6 2011/02/02 21:35:02 laffer1 Exp $

PORTNAME=	libSM
PORTVERSION=	1.1.1
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session Management library for X11
LICENSE=	x11

BUILD_DEPENDS=	${LOCALBASE}/share/aclocal/xorg-macros.m4:${PORTSDIR}/devel/xorg-macros

USE_AUTOTOOLS=	aclocal autoheader automake autoconf libtool
ACLOCAL_ARGS=	-I . -I ${LOCALBASE}/share/aclocal
AUTOMAKE_ARGS=	--add-missing
XORG_CAT=	lib
USE_XORG=	ice xproto:both xtrans

.include <bsd.port.mk>
