# $MidnightBSD$

PORTNAME=	bass
PORTVERSION=	1.2
PORTREVISION=	4
CATEGORIES=	games
MASTER_SITES=	http://de2.eu.scummvm.net/extras/Beneath%20a%20Steel%20Sky/ \
		http://de1.eu.scummvm.net/extras/Beneath%20a%20Steel%20Sky/ \
		http://at1.eu.scummvm.net/extras/Beneath%20a%20Steel%20Sky/ \
		http://lt1.eu.scummvm.net/extras/Beneath%20a%20Steel%20Sky/
DISTNAME=	bass-cd-1.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Beneath a Steel Sky: a post-apocalyptic futuristic graphical adventure

LICENSE=	bass
LICENSE_NAME=	no name
LICENSE_FILE=	${WRKSRC}/readme.txt
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

RUN_DEPENDS=	scummvm:games/scummvm

USES=		zip

NO_BUILD=	yes
NO_ARCH=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}
SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.dnr ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.dsk ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/sky.cpt ${DATADIR}
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}

.include <bsd.port.mk>
