# $MidnightBSD: mports/x11/xkbcomp/Makefile,v 1.3 2012/03/03 01:52:55 laffer1 Exp $

PORTNAME=	xkbcomp
PORTVERSION=	1.2.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compile XKB keyboard description
LICENSE=	sgi

XORG_CAT=	app
USE_XORG=	x11 xkbfile
USE_PATHFIX=	yes

PLIST_FILES=	bin/xkbcomp \
		libdata/pkgconfig/xkbcomp.pc

MAN1=		xkbcomp.1

.include <bsd.port.mk>
