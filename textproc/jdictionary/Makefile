PORTNAME=	jdictionary
DISTVERSION=	1_8
PORTREVISION=	4
CATEGORIES=	textproc java
MASTER_SITES=	SF/jdictionary/jDictionary/jDictionary%20version%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Platform independent, plugin based dictionary
WWW=		http://jdictionary.info/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/license.txt

USES=		java zip

WRKSRC=		${WRKDIR}/${PORTNAME}
NO_BUILD=	yes

DATADIR=	${JAVASHAREDIR}/${PORTNAME}
SUB_FILES=	jdictionary.sh

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/jdictionary.jar ${DATADIR}/
	${INSTALL_SCRIPT} ${WRKDIR}/jdictionary.sh ${PREFIX}/bin/jdictionary

.include <bsd.port.mk>
