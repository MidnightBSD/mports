PORTNAME=	enum34
PORTVERSION=	1.1.10
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7

LICENSE=	bsd3

USES?=		python:2.7
USE_PYTHON=	distutils autoplist
OPTIONS_DEFINE=	DOCS

PORTDOCS=	*
DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}
NO_ARCH=	yes

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}/enum/doc && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
