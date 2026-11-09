PORTNAME=	aioquic
PORTVERSION=	1.3.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of QUIC and HTTP/3
WWW=		https://aioquic.readthedocs.io/en/latest/ \
		https://github.com/aiortc/aioquic

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=42,1:security/py-cryptography@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}certifi>=0:security/py-certifi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pylsqpack>=0.3.3<0.4.0:www/py-pylsqpack@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyopenssl>=24,1:security/py-pyopenssl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}service-identity>=24.1.0:security/py-service-identity@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83 ssl
USE_PYTHON=	autoplist concurrent pep517

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
