PORTNAME=	libgme
PORTVERSION=	0.6.1
CATEGORIES=	audio
MASTER_SITES=	https://bitbucket.org/mpyne/game-music-emu/downloads/
DISTNAME=	game-music-emu-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of video game music emulators

LICENSE=	lgpl2.1 lgpl3
LICENSE_COMB=	dual

USES=		cmake dos2unix tar:bzip2
USE_LDCONFIG=	yes

PORTDOCS=	changes.txt design.txt gme.txt readme.txt

OPTIONS_DEFINE=	DOCS

pre-patch: dos2unix

post-patch:
	@${REINPLACE_CMD} -e '/pkgconfig/s/lib[[:>:]]/libdata/' \
		${WRKSRC}/gme/CMakeLists.txt

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
