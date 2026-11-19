PORTNAME=	langgraph-sdk
DISTVERSION=	0.4.14
CATEGORIES=	ai python # machine-learning
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LangGraph: SDK for interacting with LangGraph API
WWW=		https://github.com/langchain-ai/langgraph/tree/main/libs/sdk-py

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}httpx>=0.25.2:www/py-httpx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}langchain-core>=1.4.0<2:ai/py-langchain-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}langchain-protocol>=0.0.15:ai/py-langchain-protocol@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}orjson>=3.11.5:devel/py-orjson@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}websockets>=14:devel/py-websockets@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=0:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=0:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}starlette>0:www/py-starlette@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	pep517 autoplist pytest

NO_ARCH=	yes

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} PYTHONSAFEPATH=1
# The integration suite requires a separately running langgraph-api stack.
TEST_ARGS=	--import-mode=importlib --ignore=${WRKSRC}/tests/integration

.include <bsd.port.mk>
