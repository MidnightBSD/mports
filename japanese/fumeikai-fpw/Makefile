PORTNAME=	fumeikai-fpw
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/Fumeikai/
DISTNAME=	Fumeikai-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abbreviation (alphabet-->Japanese) dictionary (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	NONE

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/fumeikai
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/fumeikai-fpw/fumeikai/data
	${INSTALL_DATA} ${WRKSRC}/fumeikai/data/honmon \
		${PREFIX}/share/dict/fumeikai-fpw/fumeikai/data
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/fumeikai-fpw
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme ${DOCSDIR}

.include <bsd.port.mk>
