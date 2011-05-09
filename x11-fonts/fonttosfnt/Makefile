# $FreeBSD: ports/x11-fonts/fonttosfnt/Makefile,v 1.1 2007/05/19 20:29:25 flz Exp $
# $MidnightBSD: mports/x11-fonts/fonttosfnt/Makefile,v 1.1 2007/10/03 21:03:33 ctriv Exp $

PORTNAME=	fonttosfnt
PORTVERSION=	1.0.4
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrap a bitmap font in a sftn wrapper
LICENSE=	x11

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2

XORG_CAT=	app
USE_XORG=	xproto fontenc

PLIST_FILES=	bin/fonttosfnt

MAN1=		fonttosfnt.1

.include <bsd.port.mk>
