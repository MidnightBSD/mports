PORTNAME=	zillion
PORTVERSION=	0.1
PORTREVISION=	4
CATEGORIES=	net gnustep
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
DISTNAME=	${PORTNAME}-0_1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed computing project
WWW=		https://zillion.sourceforge.net/

LICENSE=	bsd3

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/${PORTNAME}

post-patch:
	${REINPLACE_CMD} -e 's|^CC=|# CC=|' ${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Library/Bundles/simpleZillionJob.bundle/simpleZillionJob
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Tools/zillion
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Tools/zillionClient
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Tools/zillionLoader

.include <bsd.port.mk>
