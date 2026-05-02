PORTNAME=	ryaku-fpw
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/Ryaku/
DISTNAME=	Ryaku-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abbreviation (alphabet-->Japanese) dictionary (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	other

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/ryaku
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/ryaku-fpw/ryaku/data
	${INSTALL_DATA} ${WRKSRC}/ryaku/data/honmon \
		${PREFIX}/share/dict/ryaku-fpw/ryaku/data
	${INSTALL_DATA} ${WRKSRC}/catalogs \
		${PREFIX}/share/dict/ryaku-fpw
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme ${DOCSDIR}

.include <bsd.port.mk>
