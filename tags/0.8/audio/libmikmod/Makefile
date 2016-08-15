# ports collection makefile for:	libmikmod
# Date created:		Sun Apr 11 13:06:01 PDT 1999
# Whom:			Michael Haro <mharo@area51.fremont.ca.us>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/libmikmod/Makefile,v 1.42 2006/05/03 05:14:20 edwin Exp $
#

PORTNAME=	libmikmod
PORTVERSION=	3.3.6
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF/mikmod/libmikmod/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MikMod Sound Library

LICENSE=	lgpl2.1

USES=		cpe gmake libtool pkgconfig
CPE_VENDOR=	raphael_assenat
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-esd
USE_LDCONFIG=	yes

INFO=		mikmod

.include <bsd.port.mk>
