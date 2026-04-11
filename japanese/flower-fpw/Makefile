PORTNAME=	flower-fpw
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/Flower/
DISTNAME=	Flower-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dictionary for flowers (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	NONE

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/flower
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/flower-fpw/flower/data
	${INSTALL_DATA} ${WRKSRC}/flower/data/honmon \
		${PREFIX}/share/dict/flower-fpw/flower/data
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/flower-fpw
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme ${DOCSDIR}

.include <bsd.port.mk>
