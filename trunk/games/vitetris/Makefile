# New ports collection makefile for:	vitetris
# Date created:				20 January 2008
# Whom:					<smultron@midnightbsd.org>
#
# $MidnightBSD: mports/games/vitetris/Makefile,v 1.1 2008/01/21 03:28:39 smultron Exp $
#

PORTNAME=	vitetris
PORTVERSION=	0.3.6
CATEGORIES=	games
MASTER_SITES=	http://victornils.net/tetris/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	vitetris is a terminal-based Tetris clone by Victor Nilsson.
LICENSE=	bsd2

USE_GMAKE=	yes
ALL_TARGET=	tetris
USE_XLIB=	yes

do-install:
	${CP} ${WRKSRC}/tetris ${FAKE_DESTDIR}${LOCALBASE}/bin/

.include <bsd.port.mk>
