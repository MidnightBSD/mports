PORTNAME=	CGdic-fpw
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/CGdic1.5h/
DISTNAME=	CGdic1.5h-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese dictionary for CG (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	other

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/cg
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/CGdic-fpw/cg/data
	${INSTALL_DATA} ${WRKSRC}/cg/data/honmon \
		${PREFIX}/share/dict/CGdic-fpw/cg/data
	${INSTALL_DATA} ${WRKSRC}/catalogs ${PREFIX}/share/dict/CGdic-fpw
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme ${DOCSDIR}

.include <bsd.port.mk>
