# $FreeBSD: ports/x11/sessreg/Makefile,v 1.2 2007/09/13 19:45:01 flz Exp $
# $MidnightBSD: mports/x11/sessreg/Makefile,v 1.2 2011/05/07 02:25:13 laffer1 Exp $

PORTNAME=	sessreg
PORTVERSION=	1.0.7
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage utmp/wtmp entries for non-init X clients
LICENSE=	mit

BUILD_DEPENDS+=	${LOCALBASE}/share/aclocal/xorg-macros.m4:${PORTSDIR}/devel/xorg-macros

XORG_CAT=	app
USE_XORG=	x11

USE_AUTOTOOLS=	aclocal autoheader automake autoconf
ACLOCAL_ARGS=	-I${LOCALBASE}/share/aclocal

PLIST_FILES=	bin/sessreg

MAN1=		sessreg.1

.include <bsd.port.mk>
