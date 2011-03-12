# $MidnightBSD: mports/devel/bouml-doc/Makefile,v 1.3 2009/12/31 23:48:55 laffer1 Exp $

PORTNAME=	bouml-doc
PORTVERSION=	4.23
CATEGORIES=	devel
MASTER_SITES=	SF/bouml/doc/${PORTVERSION}_ultimate/

DISTNAME=	doc${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference manual of BOUML
LICENSE=        gpl2

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/doc
DOCSDIR=	${PREFIX}/share/doc/bouml

do-install:
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${DOCSDIR})

.include <bsd.port.mk>
