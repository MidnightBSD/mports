PORTNAME=	sse-starlette
DISTVERSIONPREFIX=	v
DISTVERSION=	3.6.0
CATEGORIES=	www python
#MASTER_SITES=	PYPI # no tests
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Starlette: SSE plugin
WWW=		https://github.com/sysid/sse-starlette

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}anyio>=4.7.0:devel/py-anyio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}starlette>=0.49.1:www/py-starlette@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uvicorn>=0.34.0:www/py-uvicorn@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}asgi-lifespan>=2.1.0:devel/py-asgi-lifespan@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}testcontainers>=4.9.0:devel/py-testcontainers@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpx2>=2.12.0:www/py-httpx2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}portend>0:net/py-portend@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>=7.0.0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=0.25.0:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tenacity>=9.0.0:devel/py-tenacity@${PY_FLAVOR}
BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.11+ python-setuptools:83
USE_PYTHON=	allflavors pep517 autoplist pytest

USE_GITHUB=	yes
GH_ACCOUNT=	sysid

NO_ARCH=	yes

TEST_ENV+=	RUN_ENV=local \
		SSE_SOURCE=${WRKSRC}/sse_starlette \
		SSE_STAGE=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/sse_starlette

# Upstream's exact unit selection and coverage threshold; map only byte-identical
# staged modules so the original site-packages omission remains meaningful.
do-test:
	${CP} ${FILESDIR}/sse_starlette_coverage.py ${TEST_WRKSRC}/
	${PYTHON_CMD} ${TEST_WRKSRC}/sse_starlette_coverage.py --prepare \
		${WRKSRC}/pyproject.toml ${WRKDIR}/pyproject.test.toml
	cd ${WRKDIR} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m pytest --import-mode=importlib --ignore=${TEST_WRKSRC}/tests/experimentation \
		-m 'not (integration or experimentation)' \
		--cov-config=${WRKDIR}/pyproject.test.toml --cov-report=html \
		--cov-report=term --cov=${WRKSRC}/sse_starlette ${TEST_WRKSRC}/tests
	@if [ -S /var/run/docker.sock ]; then \
		echo "Running Docker integration tests because /var/run/docker.sock exists..."; \
		cd ${WRKDIR} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
			${PYTHON_CMD} -m pytest --import-mode=importlib --ignore=${TEST_WRKSRC}/tests/experimentation \
			-m integration ${TEST_WRKSRC}/tests; \
	else \
		echo "Skipping Docker integration tests: /var/run/docker.sock does not exist."; \
	fi

.include <bsd.port.mk>
