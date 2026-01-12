PORTNAME=	mkdocstrings-python
DISTVERSION=	2.0.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	mkdocstrings_python-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python handler for mkdocstrings
WWW=		https://github.com/mkdocstrings/python

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}griffe>=1.13.0:textproc/py-griffe@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mkdocs-autorefs>=1.4:textproc/py-mkdocs-autorefs@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}mkdocstrings-python-legacy

NO_ARCH=	yes
# circular dependency so can't run test
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.0:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
