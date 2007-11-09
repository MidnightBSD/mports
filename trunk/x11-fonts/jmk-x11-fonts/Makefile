# New ports collection makefile for:    jmk-x11-fonts
# Date created:         Sat Aug 19 20:36:34 CEST 2000
# Whom:                 olgeni@uli.it
#
# $MidnightBSD: mports/x11-fonts/jmk-x11-fonts/Makefile,v 1.3 2007/11/06 05:07:15 laffer1 Exp $
# $FreeBSD: ports/x11-fonts/jmk-x11-fonts/Makefile,v 1.9 2007/05/19 20:29:29 flz Exp $
#

PORTNAME=	jmk-x11-fonts
PORTVERSION=	3.0
PORTREVISION=	3
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.jmknoble.net/fonts/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jim Knoble's font package for X
LICENSE=	gpl2

BUILD_DEPENDS+=	${LOCALBASE}/bin/bdftopcf:${PORTSDIR}/x11-fonts/bdftopcf
BUILD_DEPENDS=  fc-cache:${PORTSDIR}/x11-fonts/fontconfig
RUN_DEPENDS=    fc-cache:${PORTSDIR}/x11-fonts/fontconfig

USE_XLIB=	yes
USE_IMAKE=	yes

do-install:
	@${MKDIR} ${PREFIX}/lib/X11/fonts/jmk
	@${INSTALL_DATA} ${WRKSRC}/*.pcf.gz ${PREFIX}/lib/X11/fonts/jmk
	@${INSTALL_DATA} ${WRKSRC}/fonts.dir ${PREFIX}/lib/X11/fonts/jmk

.include <bsd.port.mk>
