# $MidnightBSD: mports/x11/xvinfo/Makefile,v 1.3 2012/03/03 01:52:57 laffer1 Exp $

PORTNAME=	xvinfo
PORTVERSION=	1.1.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Print out X-Video extension adaptor information
LICENSE=	unknown

XORG_CAT=	app
USE_XORG=	xv x11

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xorg-macros.pc:${PORTSDIR}/devel/xorg-macros

PLIST_FILES=	bin/xvinfo

MAN1=		xvinfo.1

.include <bsd.port.mk>
