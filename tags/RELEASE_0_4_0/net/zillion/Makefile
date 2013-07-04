# $FreeBSD: ports/net/zillion/Makefile,v 1.1 2006/11/09 20:08:01 dinoex Exp $
# $MidnightBSD: mports/net/zillion/Makefile,v 1.3 2008/10/21 14:33:09 laffer1 Exp $

PORTNAME=	zillion
PORTVERSION=	0.1
PORTREVISION=	1
CATEGORIES=	net gnustep
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
DISTNAME=	${PORTNAME}-0_1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed computing project
LICENSE=	bsd3

WRKSRC=		${WRKDIR}/${PORTNAME}
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

post-patch:
	${REINPLACE_CMD} -e 's|^CC=|# CC=|' ${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
