PORTNAME=	langchain-tests
DISTVERSION=	1.1.9
CATEGORIES=	ai python # machine-learning
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LangChain: Standard tests for LangChain implementations
WWW=		https://github.com/langchain-ai/langchain/tree/master/libs/standard-tests

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}httpx>=0.28.1:www/py-httpx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpx<1.0.0:www/py-httpx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}langchain-core>=1.4.0:ai/py-langchain-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}langchain-core<2.0.0:ai/py-langchain-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>=1.26.2,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9.0.3,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest<10.0.0,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=1.3.0:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-asyncio<2.0.0:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-benchmark>0:devel/py-pytest-benchmark@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-codspeed>0:devel/py-pytest-codspeed@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-recording>0:devel/py-pytest-recording@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-socket>=0.7.0:devel/py-pytest-socket@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-socket<1.0.0:devel/py-pytest-socket@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}syrupy>=5.0.0:devel/py-syrupy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}syrupy<2027:devel/py-syrupy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}vcrpy>=8.0.0:devel/py-vcrpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}vcrpy<9.0.0:devel/py-vcrpy@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	pep517 autoplist pytest

NO_ARCH=	yes

.include <bsd.port.mk>
