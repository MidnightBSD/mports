# $MidnightBSD$

PORTNAME=	libSM
PORTVERSION=	1.1.0
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session Management library for X11
LICENSE=	x11

BUILD_DEPENDS=	${LOCALBASE}/share/aclocal/xorg-macros.m4:${PORTSDIR}/devel/xorg-macros

USE_AUTOTOOLS=	aclocal:110 autoheader:262 automake:110 autoconf:262 libtool:15
ACLOCAL_ARGS=	-I . -I ${LOCALBASE}/share/aclocal
AUTOMAKE_ARGS=	--add-missing
XORG_CAT=	lib
USE_XORG=	ice xproto:both xtrans

.include <bsd.port.mk>
