PORTNAME=	inflect
PORTVERSION=	7.5.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate plurals, singular nouns, ordinals, indefinite articles
WWW=		https://github.com/jaraco/inflect

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.1:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}more-itertools>=8.5.0:devel/py-more-itertools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typeguard>=4.0.1:devel/py-typeguard@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>=0:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.2,1:devel/py-pytest@${PY_FLAVOR}
TEST_WRKSRC=	${WRKDIR}/staged-tests
PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} PYTHONSAFEPATH=1
TEST_ENV+=	PYTHONDONTWRITEBYTECODE=1
TEST_ARGS=	--doctest-modules --import-mode=importlib ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/inflect tests docs

pre-test:
	${MKDIR} ${TEST_WRKSRC}
	${CP} -R ${WRKSRC}/tests ${WRKSRC}/docs ${TEST_WRKSRC}/
	${CP} ${WRKSRC}/pytest.ini ${TEST_WRKSRC}/

.include <bsd.port.mk>
