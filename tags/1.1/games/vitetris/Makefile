# New ports collection makefile for:	vitetris
# Date created:				27 April 2008
# Whom:					<smultron@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	vitetris
PORTVERSION=	0.57
CATEGORIES=	games
MASTER_SITES=	http://victornils.net/tetris/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	vitetris is a terminal-based Tetris clone by Victor Nilsson.

LICENSE=	bsd2

USES=		gmake
ALL_TARGET=	tetris
USE_XORG=	x11
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-with-x
MAKE_JOBS_UNSAFE=	yes

do-install:
	${CP} ${WRKSRC}/tetris ${FAKE_DESTDIR}${LOCALBASE}/bin/

.include <bsd.port.mk>
