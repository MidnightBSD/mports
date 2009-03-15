# New ports collection makefile for:   libXfont
# Date Created:			29 Oct, 2003
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $FreeBSD: ports/x11-fonts/libXfont/Makefile,v 1.17 2007/09/13 19:44:52 flz Exp $
# $MidnightBSD: mports/x11-fonts/libXfont/Makefile,v 1.2 2008/03/28 08:06:21 ctriv Exp $
#

PORTNAME=	libXfont
PORTVERSION=	1.3.4
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X font libary
LICENSE=	bsd4

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2

XORG_CAT=	lib
USE_XORG=	fontcacheproto xproto:both xtrans fontsproto:both fontenc

.include <bsd.port.mk>
