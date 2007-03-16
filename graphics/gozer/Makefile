# Ports collection makefile for:	gom
# Date created:				12 Nov 2000
# Whom:					Jeremy Norris <ishmael27@home.com>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/gozer/Makefile,v 1.12 2006/03/08 11:14:15 garga Exp $
#

PORTNAME=	gozer
PORTVERSION=	0.7
CATEGORIES=	graphics
MASTER_SITES=	http://linuxbrit.co.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Commandline text rendering utility - creates images from text

LIB_DEPENDS=	giblib.1:${PORTSDIR}/graphics/giblib

USE_X_PREFIX=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-porbld-freebsd6.0
CONFIGURE_ARGS=	--with-giblib-prefix=${X11BASE}

MAN1=		gozer.1

.if defined(NOPORTDOCS)
MAKE_ENV=	NO_DOC=yes
.endif

.include <bsd.port.mk>
