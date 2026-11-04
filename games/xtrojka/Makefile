PORTNAME=	xtrojka
PORTVERSION=	1.2.3
PORTREVISION=	3
CATEGORIES=	games
MASTER_SITES=	SUNSITE/games/arcade/tetris
DISTNAME=	${PORTNAME}${PORTVERSION:C/\.//g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Game of skill similar to T*tris

LICENSE=	other
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

USES=		xorg
USE_XORG=	x11 xt xorgproto xaw xmu xext

MAKE_JOBS_UNSAFE=	yes
INSTALL_TARGET=	install PREFIX=${FAKE_DESTDIR}${TRUE_PREFIX}

WRKSRC=		${WRKDIR}/${DISTNAME}

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|CFLAGS=|CFLAGS=-Wno-error=incompatible-function-pointer-types |g' \
		${WRKSRC}/Makefile

pre-install:
	${MKDIR} ${PREFIX}/share/xtrojka

.include <bsd.port.mk>
