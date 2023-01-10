PORTNAME=	bass
PORTVERSION=	1.2
PORTREVISION=	5
CATEGORIES=	games
MASTER_SITES=	SF/scummvm/extras/Beneath%20a%20Steel%20Sky/ \
		https://downloads.scummvm.org/frs/extras/Beneath%20a%20Steel%20Sky/
DISTNAME=	bass-cd-1.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Beneath a Steel Sky: a post-apocalyptic futuristic graphical adventure
WWW=		https://www.scummvm.org/games/ #games-sky

LICENSE=	bass
LICENSE_NAME=	no name
LICENSE_FILE=	${WRKSRC}/readme.txt
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

RUN_DEPENDS=	scummvm:games/scummvm

USES=		desktop-file-utils zip

NO_BUILD=	yes
NO_ARCH=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}
SUB_FILES=	bass.desktop

OPTIONS_DEFINE=	DOCS

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.dnr ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.dsk ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.cpt ${DATADIR}
	${INSTALL_DATA} ${WRKDIR}/bass.desktop ${PREFIX}/share/applications
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}

.include <bsd.port.mk>
