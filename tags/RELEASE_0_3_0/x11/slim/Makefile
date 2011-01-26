# $MidnightBSD: mports/x11/slim/Makefile,v 1.15 2010/03/26 00:49:23 laffer1 Exp $

PORTNAME=	slim
PORTVERSION=	1.3.1
PORTREVISION=	6
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_BERLIOS} \
		http://depot.fsck.ch/mirror/distfiles/
MASTER_SITE_SUBDIR=slim

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Graphical login manager for X11, derived from Login.app
LICENSE=	gpl2

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		png.6:${PORTSDIR}/graphics/png \
		freetype:${PORTSDIR}/print/freetype2

USE_XORG=	x11 xft xmu xorg-server xrender
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
