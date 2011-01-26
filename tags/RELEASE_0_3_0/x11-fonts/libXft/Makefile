# $MidnightBSD: mports/x11-fonts/libXft/Makefile,v 1.5 2008/08/20 17:10:44 crash Exp $

PORTNAME=	libXft
PORTVERSION=	2.1.13
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A client-sided font API for X applications
LICENSE=	x11

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2
BUILD_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig
RUN_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig

XORG_CAT=	lib
USE_XORG=	xproto:both xrender

MAN1=		xft-config.1
MAN3=		Xft.3

.include <bsd.port.mk>
