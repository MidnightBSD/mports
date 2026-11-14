PORTNAME=	langchain-protocol
DISTVERSION=	0.0.20
CATEGORIES=	ai python # machine-learning
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the LangChain agent streaming protocol
WWW=		https://github.com/langchain-ai/agent-protocol/tree/main/streaming \
		https://github.com/langchain-ai/agent-protocol

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling127>=1.27.0<1.30:devel/py-hatchling127@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.13.0<5.0.0:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	pep517 autoplist

NO_ARCH=	yes

_HATCHLING_PRIVATE?=	${PYTHONPREFIX_LIBDIR}/mports-hatchling/127
MAKE_ENV+=	PYTHONPATH=${_HATCHLING_PRIVATE} PATH=${_HATCHLING_PRIVATE}/bin:${PATH}

.include <bsd.port.mk>
