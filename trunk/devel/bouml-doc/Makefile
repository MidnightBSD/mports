# $MidnightBSD$

PORTNAME=	bouml-doc
PORTVERSION=	4.23
CATEGORIES=	devel

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
