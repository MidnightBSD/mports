# New ports collection makefile for:    jmk-x11-fonts
# Date created:         Sat Aug 19 20:36:34 CEST 2000
# Whom:                 olgeni@uli.it
#
# $MidnightBSD$
# $FreeBSD: ports/x11-fonts/jmk-x11-fonts/Makefile,v 1.9 2007/05/19 20:29:29 flz Exp $
#

PORTNAME=	jmk-x11-fonts
PORTVERSION=	3.0
PORTREVISION=	4
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.jmknoble.net/fonts/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jim Knoble's font package for X

LICENSE=	gpl2

BUILD_DEPENDS+=	bdftopcf:${PORTSDIR}/x11-fonts/bdftopcf \
		mkfontsdir:${PORTSDIR}/x11-fonts/mkfontdir \
		mkfontscale:${PORTSDIR}/x11-fonts/mkfontscale \
		fc-cache:${PORTSDIR}/x11-fonts/fontconfig 
RUN_DEPENDS+=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig

USES=		fonts imake

do-install:
	${MKDIR} ${FONTSDIR}
	@${INSTALL_DATA} ${WRKSRC}/*.pcf.gz ${FONTSDIR}

.include <bsd.port.mk>
