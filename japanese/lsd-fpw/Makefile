PORTNAME=	lsd-fpw
PORTVERSION=	3.0.1
PORTREVISION=	0
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/lsd/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese - English Dictionary for Life Science (EPWING V1 format)
WWW=		http://openlab.ring.gr.jp/edict/fpw/

LICENSE=	NONE

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/lsd
EXTRACT_BEFORE_ARGS=	-qL

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PREFIX}/share/dict/lsd-fpw/lsd/data
	${INSTALL_DATA} ${WRKSRC}/lsd/data/honmon \
		${PREFIX}/share/dict/lsd-fpw/lsd/data
	${INSTALL_DATA} ${WRKSRC}/catalogs ${PREFIX}/share/dict/lsd-fpw
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} readme.pkg readme.txt \
		${DOCSDIR})

.include <bsd.port.mk>
