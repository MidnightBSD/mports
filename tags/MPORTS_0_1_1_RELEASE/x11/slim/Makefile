# New ports collection makefile for:	slim
# Date created:				8 Jan 2006
# Whom:					Tobias Roth <ports@fsck.ch>
#
# $MidnightBSD: mports/x11/slim/Makefile,v 1.8 2007/07/30 06:24:50 laffer1 Exp $
# $FreeBSD: ports/x11/slim/Makefile,v 1.6 2007/01/17 04:41:48 clsung Exp $
#

PORTNAME=	slim
PORTVERSION=	1.3.0
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_BERLIOS} \
		http://depot.fsck.ch/mirror/distfiles/
MASTER_SITE_SUBDIR=slim

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Graphical login manager for X11, derived from Login.app
LICENSE=	gpl2

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png \
		freetype:${PORTSDIR}/print/freetype2
RUN_DEPENDS=	${X11BASE}/bin/X:${X_SERVER_PORT}
BUILD_DEPENDS=	${X11BASE}/include/X11/Xft/Xft.h:${PORTSDIR}/x11-fonts/libXft

USE_XLIB=	yes
USE_RC_SUBR=	slim.sh

MAN1=		slim.1

MAKEFILE=	Makefile.freebsd

.include <bsd.port.pre.mk>

pre-build:
	@${REINPLACE_CMD} \
			-e 's|%%X11BASE%%|${X11BASE}|g' \
			-e 's|%%LOCALBASE%%|${PREFIX}|g' \
			${WRKSRC}/Makefile.freebsd \
			${WRKSRC}/slim.conf

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	@${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.conf ${PREFIX}/etc/${PORTNAME}.conf.sample
	@${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${PREFIX}/man/man1
	@${MKDIR} ${DATADIR}/themes/default
	@${INSTALL_DATA} ${WRKSRC}/themes/default/${PORTNAME}.theme ${DATADIR}/themes/default
	@${INSTALL_DATA} ${WRKSRC}/themes/default/panel.png ${DATADIR}/themes/default
	@${INSTALL_DATA} ${FILESDIR}/background.jpg ${DATADIR}/themes/default


.include <bsd.port.post.mk>
