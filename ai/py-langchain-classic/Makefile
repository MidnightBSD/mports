PORTNAME=	langchain-classic
DISTVERSION=	1.0.8
CATEGORIES=	ai python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LangChain: Building applications with LLMs through composability
WWW=		https://github.com/langchain-ai/langchain

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}langchain-core>=1.4.4:ai/py-langchain-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}langchain-text-splitters>=1.1.2:ai/py-langchain-text-splitters@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}langsmith>=0.1.17:ai/py-langsmith@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2>=2.7.4:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=5.3.0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.0.0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlalchemy20>=1.4.0:databases/py-sqlalchemy20@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
