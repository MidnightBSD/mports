# New ports collection makefile for:	Xft
# Date created:		06 October 2002
# Whom:			Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD: ports/x11-fonts/libXft/Makefile,v 1.44 2007/05/19 20:29:31 flz Exp $
# $MidnightBSD: mports/x11-fonts/libXft/Makefile,v 1.4 2007/10/04 20:05:15 ctriv Exp $
#

PORTNAME=	libXft
PORTVERSION=	2.1.13
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
