# $MidnightBSD: mports/x11-wm/xcompmgr/Makefile,v 1.2 2012/03/06 00:20:12 laffer1 Exp $

PORTNAME=	xcompmgr
PORTVERSION=	1.1.6
CATEGORIES=	x11-wm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A sample X compositing manager
LICENSE=	mit

XORG_CAT=	app
USE_XORG=	x11 xcomposite xfixes xdamage xrender

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xorg-macros.pc:${PORTSDIR}/devel/xorg-macros

PLIST_FILES=	bin/${PORTNAME}

MAN1=		xcompmgr.1

.include <bsd.port.mk>
