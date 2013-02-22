# $MidnightBSD: mports/x11/xsm/Makefile,v 1.3 2012/03/03 01:52:57 laffer1 Exp $

PORTNAME=	xsm
PORTVERSION=	1.0.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Session Manager
LICENSE=	mit

XORG_CAT=	app
USE_XORG=	xt xaw

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xorg-macros.pc:${PORTSDIR}/devel/xorg-macros

MAN1=		xsm.1

.include <bsd.port.mk>
