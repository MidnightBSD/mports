PORTNAME=	mktestdocs
DISTVERSION=	0.2.5
CATEGORIES=	devel python
#MASTER_SITES=	PYPI # incomplete test data
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run pytest against markdown files and docstrings
WWW=		https://github.com/koaning/mktestdocs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist pytest

USE_GITHUB=	yes
GH_ACCOUNT=	koaning

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

pre-test:
	${MKDIR} ${WRKDIR}/.bin
	${LN} -sf ${PYTHON_CMD} ${WRKDIR}/.bin/python

NO_ARCH=	yes

# tests as of 0.2.5: 39 passed, 2 warnings

.include <bsd.port.mk>
