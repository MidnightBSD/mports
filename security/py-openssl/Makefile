PORTNAME=	openssl
PORTVERSION=	23.2.0
PORTEPOCH=	1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyOpenSSL-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to the OpenSSL library
WWW=		https://github.com/pyca/pyopenssl

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe python
USE_PYTHON=	autoplist concurrent cryptography distutils pythonprefix

NO_ARCH=	yes
NO_TEST=	yes

CPE_VENDOR=	jean-paul_calderone
CPE_PRODUCT=	py${PORTNAME}

.include <bsd.port.mk>
