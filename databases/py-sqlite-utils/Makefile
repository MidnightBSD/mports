PORTNAME=	sqlite-utils
PORTVERSION=	4.2.1
CATEGORIES=	databases python
MASTER_SITES=	PYPI \
		https://codeload.github.com/simonw/sqlite-utils/tar.gz/28dc6278cc03a9245325d056e6986818544abc68?filename=/:tests
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python CLI utility and library for manipulating SQLite databases
WWW=		https://github.com/simonw/sqlite-utils

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pip>0:devel/py-pip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click-default-group>=1.2.3:devel/py-click-default-group@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click>=8.3.1:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pluggy>0:devel/py-pluggy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dateutil>0:devel/py-python-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlite-fts4>0:databases/py-sqlite-fts4@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tabulate>0:devel/py-tabulate@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>0:devel/py-hypothesis@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

DISTFILES=	${PORTNAME:S/-/_/}-${DISTVERSION}${EXTRACT_SUFX} \
		sqlite-utils-tests-28dc6278cc03a9245325d056e6986818544abc68.tar.gz:tests
EXTRACT_ONLY=	${PORTNAME:S/-/_/}-${DISTVERSION}${EXTRACT_SUFX}

WRKSRC=		${WRKDIR}/${PORTNAME:S/-/_/}-${DISTVERSION}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		PYTHONDONTWRITEBYTECODE=1
TEST_WRKSRC=	${WRKDIR}
TEST_ARGS=	${WRKSRC}/tests --import-mode=importlib

pre-test:
	${TAR} -xzf ${DISTDIR}/sqlite-utils-tests-28dc6278cc03a9245325d056e6986818544abc68.tar.gz \
		-C ${WRKSRC} --strip-components 1 \
		sqlite-utils-28dc6278cc03a9245325d056e6986818544abc68/tests/sniff

.include <bsd.port.mk>
