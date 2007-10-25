# New ports collection makefile for:    jmk-x11-fonts
# Date created:         Sat Aug 19 20:36:34 CEST 2000
# Whom:                 olgeni@uli.it
#
# $MidnightBSD: mports/x11-fonts/jmk-x11-fonts/Makefile,v 1.1 2007/08/18 08:54:05 laffer1 Exp $
# $FreeBSD: ports/x11-fonts/jmk-x11-fonts/Makefile,v 1.9 2007/05/19 20:29:29 flz Exp $
#

PORTNAME=	jmk-x11-fonts
PORTVERSION=	3.0
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.jmknoble.net/fonts/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jim Knoble's font package for X
LICENSE=	gpl2

BUILD_DEPENDS+=	${PORTSDIR}/x11/xorg-clients \
		${LOCALBASE}/bin/bdftopcf:${PORTSDIR}/x11-fonts/bdftopcf

USE_XLIB=	yes
USE_IMAKE=	yes

do-install:
	@${MKDIR} ${PREFIX}/lib/X11/fonts/jmk
	@${INSTALL_DATA} ${WRKSRC}/*.pcf.gz ${PREFIX}/lib/X11/fonts/jmk
	@${INSTALL_DATA} ${WRKSRC}/fonts.dir ${PREFIX}/lib/X11/fonts/jmk

.include <bsd.port.mk>
