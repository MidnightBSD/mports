# $MidnightBSD: mports/devel/bouml-doc/Makefile,v 1.2 2009/07/12 15:47:17 laffer1 Exp $

PORTNAME=	bouml-doc
PORTVERSION=	4.12.4
CATEGORIES=	devel
MASTER_SITES=	SF/bouml/bouml%20documentation/reference%20manual%20${PORTVERSION}	\
		http://bouml.free.fr/

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
