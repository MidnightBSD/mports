PORTNAME=	openssl
PORTVERSION=	25.0.0
PORTEPOCH=	1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyopenssl-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to the OpenSSL library
WWW=		https://github.com/pyca/pyopenssl

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.9:devel/py-typing-extensions@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	autoplist concurrent cryptography distutils pythonprefix

NO_ARCH=	yes
NO_TEST=	yes

CPE_VENDOR=	jean-paul_calderone
CPE_PRODUCT=	py${PORTNAME}

.include <bsd.port.mk>
