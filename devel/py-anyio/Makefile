PORTNAME=	anyio
PORTVERSION=	4.15.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High level compatibility layer for multiple asynchronous event loop implementations
WWW=		https://github.com/agronholm/anyio

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.4:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}idna>=2.8:dns/py-idna@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}truststore>=0.9.1:security/py-truststore@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	TRIO
TRIO_DESC=	Use trio as backend

TRIO_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}trio>=0.32.0:net/py-trio@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}exceptiongroup>=1.1.1:devel/py-exceptiongroup@${PY_FLAVOR}
.endif

.if ${PYTHON_REL} < 31500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.16.0:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
