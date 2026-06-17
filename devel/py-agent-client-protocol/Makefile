PORTNAME=	agent-client-protocol
PORTVERSION=	0.10.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	agent_client_protocol-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python implementation of the Agent Client Protocol
WWW=		https://agentclientprotocol.github.io/python-sdk/ \
		https://github.com/agentclientprotocol/python-sdk

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>=0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pydantic2>=2.7:devel/py-pydantic2@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
