# $MidnightBSD: mports/devel/libtool15/Makefile,v 1.6 2008/07/31 02:38:35 laffer1 Exp $

PORTNAME?=	libtool
PORTVERSION=	1.5.26
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libtool
DISTNAME=	libtool-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic shared library support script
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS?= --disable-ltdl-install
CONFIGURE_ARGS+= --infodir=${PREFIX}/info
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1
INFO?=		libtool

.include <bsd.port.mk>
