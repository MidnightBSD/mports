# New ports collection makefile for:	libtool
# Date created:		6 May 1998
# Whom:			Motoyuki Kasahara <m-kasahr@sra.co.jp>
#
# $MidnightBSD: mports/devel/libtool15/Makefile,v 1.2 2006/09/25 16:34:09 archite Exp $
# $FreeBSD: ports/devel/libtool15/Makefile,v 1.53 2006/05/04 21:40:52 edwin Exp $
#

PORTNAME?=	libtool
PORTVERSION=	1.5.24
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	libtool
DISTNAME=	libtool-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Generic shared library support script

GNU_CONFIGURE=	 yes
CONFIGURE_ARGS?= --disable-ltdl-install
CONFIGURE_ARGS+= --infodir=${PREFIX}/info
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
INFO?=		libtool

.include <bsd.port.mk>
