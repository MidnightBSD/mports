# $FreeBSD: ports/net/zillion/Makefile,v 1.1 2006/11/09 20:08:01 dinoex Exp $
# $MidnightBSD$

PORTNAME=	zillion
PORTVERSION=	0.1
PORTREVISION=	3
CATEGORIES=	net gnustep
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
DISTNAME=	${PORTNAME}-0_1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed computing project

LICENSE=	bsd3

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/${PORTNAME}

post-patch:
	${REINPLACE_CMD} -e 's|^CC=|# CC=|' ${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Library/Bundles/simpleZillionJob.bundle/simpleZillionJob
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Tools/zillion
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Tools/zillionClient
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Tools/zillionLoader

.include <bsd.port.mk>
