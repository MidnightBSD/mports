# $MidnightBSD: mports/x11/slim/Makefile,v 1.17 2011/05/07 02:32:39 laffer1 Exp $

PORTNAME=	slim
PORTVERSION=	1.3.2
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	http://slim.berlios.de/releases/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Graphical login manager for X11, derived from Login.app
LICENSE=	gpl2

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png \
		freetype:${PORTSDIR}/print/freetype2 \
		fontconfig:${PORTSDIR}/x11-fonts/fontconfig

USE_XORG=	x11 xft xmu xorg-server xrender
USE_RC_SUBR=	slim.sh
SUB_FILES=	pkg-message

MAN1=		slim.1

MAKEFILE=	Makefile.freebsd

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
			${WRKSRC}/${PORTNAME}.conf

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	@${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.conf ${PREFIX}/etc/${PORTNAME}.conf.sample
	@${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${PREFIX}/man/man1
	@${MKDIR} ${DATADIR}/themes/default
	@${INSTALL_DATA} ${WRKSRC}/themes/default/${PORTNAME}.theme ${DATADIR}/themes/default
	@${INSTALL_DATA} ${WRKSRC}/themes/default/panel.png ${DATADIR}/themes/default
	@${INSTALL_DATA} ${FILESDIR}/background.jpg ${DATADIR}/themes/default


.include <bsd.port.post.mk>
