# $MidnightBSD: mports/x11-fonts/libXfont/Makefile,v 1.5 2011/08/11 22:16:13 laffer1 Exp $

PORTNAME=	libXfont
PORTVERSION=	1.4.5
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X font libary
LICENSE=	bsd4

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2

XORG_CAT=	lib
USE_XORG=	xproto:both xtrans fontsproto:both fontenc

CONFIGURE_ARGS=--without-xmlto --disable-devel-docs

.include <bsd.port.mk>
