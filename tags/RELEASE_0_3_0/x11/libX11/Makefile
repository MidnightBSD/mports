# $MidnightBSD: mports/x11/libX11/Makefile,v 1.5 2009/09/20 01:41:33 smultron Exp $

PORTNAME=	libX11
PORTVERSION=	1.2.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 library
LICENSE=	x11

BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/xcb.pc:${PORTSDIR}/x11/libxcb \
		${LOCALBASE}/share/aclocal/xorg-macros.m4:${PORTSDIR}/devel/xorg-macros
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/xcb.pc:${PORTSDIR}/x11/libxcb

XORG_CAT=	lib
USE_XORG=	bigreqsproto xau xcmiscproto xdmcp xextproto xtrans \
		kbproto:both inputproto xf86bigfontproto xproto:both
USE_AUTOTOOLS=	aclocal:110 autoheader:262 automake:110 autoconf:262 libtool:22
ACLOCAL_ARGS=	-I . -I ${LOCALBASE}/share/aclocal
AUTOMAKE_ARGS=	--add-missing
CONFIGURE_ARGS+=	--datadir=${PREFIX}/lib \
			--with-xcb=yes

post-install:
	${INSTALL_DATA} ${WRKSRC}/x11-xcb.pc ${PREFIX}/libdata/pkgconfig/
	${INSTALL_DATA} ${WRKSRC}/x11.pc ${PREFIX}/libdata/pkgconfig/

.include "${.CURDIR}/manpages"
.include <bsd.port.mk>
