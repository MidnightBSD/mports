# $MidnightBSD: mports/x11/luit/Makefile,v 1.4 2012/03/02 23:44:41 laffer1 Exp $

PORTNAME=	luit
PORTVERSION=	1.1.0
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Locale and ISO 2022 support for Unicode terminals
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11 fontenc

CONFIGURE_ARGS=	--datadir=${LOCALBASE}/lib
# Use openpty(), MidnightBSD 0.3 has grantpt but not /dev/ptmx
CONFIGURE_ENV=	ac_cv_func_grantpt=no

PLIST_FILES=	bin/luit

MAN1=		luit.1

.include <bsd.port.mk>
