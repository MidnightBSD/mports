# $MidnightBSD: mports/x11/sessreg/Makefile,v 1.3 2012/03/03 01:52:54 laffer1 Exp $

PORTNAME=	sessreg
PORTVERSION=	1.0.8
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage utmp/wtmp entries for non-init X clients
LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xorg-macros.pc:${PORTSDIR}/devel/xorg-macros

XORG_CAT=	app
USE_XORG=	x11

USE_AUTOTOOLS=	aclocal autoheader automake autoconf
ACLOCAL_ARGS=	-I${LOCALBASE}/share/aclocal

PLIST_FILES=	bin/sessreg

MAN1=		sessreg.1

.include <bsd.port.mk>
