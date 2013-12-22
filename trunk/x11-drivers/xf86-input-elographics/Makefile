# $FreeBSD: ports/x11-drivers/xf86-input-elographics/Makefile,v 1.1 2007/05/19 20:28:39 flz Exp $
# $MidnightBSD$

PORTNAME=	xf86-input-elographics
PORTVERSION=	${ELO_VERSION}
PORTREVISION=	${ELO_REVISION}
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org elographics input driver
LICENSE=	mit

XORG_CAT=	driver

.include <bsd.mport.options.mk>

.if defined(WITH_NEW_XORG)
ELO_VERSION=	1.4.1
ELO_REVISION=	0
.else
ELO_VERSION=	1.2.4
ELO_REVISION=	0
.endif

.include <bsd.port.mk>
