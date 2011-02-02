# $MidnightBSD: mports/devel/libtool22/Makefile,v 1.4 2010/07/31 02:59:22 laffer1 Exp $

PORTNAME?=	libtool
PORTVERSION=	2.2.10
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libtool
DISTNAME=	libtool-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic shared library support script
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS?= --disable-ltdl-install
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
INFO?=		libtool

.include <bsd.port.mk>
