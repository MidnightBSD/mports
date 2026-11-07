PORTNAME=	boolean.py
DISTVERSION=	5.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create and parse boolean expressions and create custom boolean DSL
WWW=		https://github.com/bastikr/boolean.py

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ARGS=	boolean

NO_ARCH=	yes
PORTDOCS=	*

OPTIONS_DEFINE=		DOCS
DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinxcontrib-apidoc>=0.3.0:textproc/py-sphinxcontrib-apidoc@${PY_FLAVOR}

DOCS_USES=	gmake

post-build-DOCS-on:
	@${SETENV} ${MAKE_ENV} ${GMAKE} -C ${BUILD_WRKSRC}/docs html

post-fake-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${BUILD_WRKSRC}/docs/build/html && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} \
			"! -name .buildinfo -and ! -name objects.inv")

DISTNAME=	${PORTNAME:C/[-_.]+/_/g}-${DISTVERSION}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-xdist>=2,1:devel/py-pytest-xdist@${PY_FLAVOR}

.include <bsd.port.mk>
