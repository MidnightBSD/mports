PORTNAME=	langchain-openai
DISTVERSION=	1.1.11
PORTREVISION=	1
CATEGORIES=	ai python # machine-learning
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LangChain: Integration package connecting OpenAI and LangChain
WWW=		https://python.langchain.com/docs/introduction/ \
		https://github.com/langchain-ai/langchain

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}langchain-core>=1.2.18:ai/py-langchain-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}openai>=2.26.0:ai/py-openai@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tiktoken>=0.7.0:textproc/py-tiktoken@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist pytest

NO_ARCH=	yes

# tests as of 0.3.28: 233 failed, 262 passed, 11 skipped, 2 xfailed, 5 xpassed, 52 warnings, 131 errors, 8 rerun in 217.53s (0:03:37)

.include <bsd.port.mk>
