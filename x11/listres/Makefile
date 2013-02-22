# $FreeBSD: ports/x11/listres/Makefile,v 1.1 2007/05/19 20:27:04 flz Exp $
# $MidnightBSD: mports/x11/listres/Makefile,v 1.2 2011/05/07 00:37:02 laffer1 Exp $

PORTNAME=	listres
PORTVERSION=	1.0.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	List resources in widgets
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	xproto xt xmu xaw

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xorg-macros.pc:${PORTSDIR}/devel/xorg-macros

PLIST_FILES=	bin/listres

MAN1=		listres.1

.include <bsd.port.mk>
