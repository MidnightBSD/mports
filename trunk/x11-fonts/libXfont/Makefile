# $FreeBSD: ports/x11-fonts/libXfont/Makefile,v 1.17 2007/09/13 19:44:52 flz Exp $
# $MidnightBSD: mports/x11-fonts/libXfont/Makefile,v 1.4 2011/05/10 13:35:06 laffer1 Exp $

PORTNAME=	libXfont
PORTVERSION=	1.4.4
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X font libary
LICENSE=	bsd4

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2

XORG_CAT=	lib
USE_XORG=	xproto:both xtrans fontsproto:both fontenc

CONFIGURE_ARGS=--without-xmlto --disable-devel-docs

.include <bsd.port.mk>
