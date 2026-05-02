PORTNAME=	ASCIIdates98-fpw
PORTVERSION=	1.0
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/ASCIIdates98/
DISTNAME=	${PORTNAME:S/-fpw//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese dictionary for PC terms in '98 ASCII Dates Book (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	other

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/ascdates
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/ASCIIdates98-fpw/ascdates/data
	${INSTALL_DATA} ${WRKSRC}/ascdates/data/honmon \
		${PREFIX}/share/dict/ASCIIdates98-fpw/ascdates/data
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/ASCIIdates98-fpw
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme ${DOCSDIR}

.include <bsd.port.mk>
