# $MidnightBSD: mports/devel/py-elementtree/Makefile,v 1.1 2008/06/14 00:14:52 laffer1 Exp $
# $FreeBSD: ports/devel/py-elementtree/Makefile,v 1.3 2007/07/30 09:41:12 alexbl Exp $

PORTNAME=	elementtree
PORTVERSION=	1.2.6
CATEGORIES=	devel python
MASTER_SITES=	http://effbot.org/media/downloads/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-${PORTVERSION}-20050316

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Container for hierarchical data structures written in Python
LICENSE=	unknown

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_PKGVERSION=	1.2.6-20050316

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
EXAMPLESDIR=	${PREFIX}/share/examples/${PKGNAMEPREFIX}${PORTNAME}

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	${CP} -R ${WRKSRC}/docs/ ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
	${CP} -R ${WRKSRC}/samples/ ${EXAMPLESDIR}
.endif

.include <bsd.port.mk>
