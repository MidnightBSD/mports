PORTNAME=	b2sdk
DISTVERSION=	2.12.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backblaze B2 SDK
WWW=		https://github.com/Backblaze/b2-sdk-python

LICENSE=	mit Apache-2.0
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE
LICENSE_FILE_Apache-2.0=	${WRKSRC}/b2sdk/_internal/requests/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0.4:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1.24.2:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}annotated-types>=0.5.0:devel/py-annotated-types@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}logfury>=1.0.1<2.0.0:devel/py-logfury@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.33.0<3.0.0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tqdm>=4.5.0<5.0.0:misc/py-tqdm@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=9.0.3<10,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}coverage>=7.13.5<8:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2>=2.13.3<3:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=7.1.0<8:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-lazy-fixtures>=1.4.0<2:devel/py-pytest-lazy-fixtures@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=3.15.1<4:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>=2.4.0<3:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.8.0<4,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}responses>=0.26.0<1:devel/py-responses@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tenacity>=9.1.4<10:devel/py-tenacity@${PY_FLAVOR}
USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517 pytest

USE_GITHUB=	nodefault
GH_TUPLE=	Backblaze:b2-sdk-python:9827cf3d378ff88841cf0ed6b619588fdb266fbf:tests

TEST_ENV=	PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${TEST_WRKSRC}

NO_ARCH=	yes

post-extract:
	${CP} -R ${WRKSRC_tests}/test ${WRKSRC}/test

# Match upstream's complete four-API unit/doctest and branch coverage matrix.
# Filesystem permission tests require an unprivileged test runner.
do-test:
	@set -e; cd ${TEST_WRKSRC}; append=""; \
	for api in v3 v2 v1 v0; do \
		${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest \
			--api=$${api} --doctest-modules -n ${MAKE_JOBS_NUMBER} \
			--cov=b2sdk --cov-branch --cov-report=xml $${append} test/unit; \
		append=--cov-append; \
	done
	cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m coverage report --fail-under=75 --show-missing --skip-covered

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31200
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.7.1:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
