PORTNAME=	openssl
PORTVERSION=	19.1.0
PORTREVISION=	0
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyOpenSSL-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to the OpenSSL library

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=2.1.4:security/py-cryptography@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.5.2:devel/py-six@${PY_FLAVOR}

OPTIONS_DEFINE=	EXAMPLES

USES=		cpe python:3.6+
USE_PYTHON=	autoplist concurrent distutils pythonprefix

NO_ARCH=	yes
NO_TEST=	yes

CPE_VENDOR=	jean-paul_calderone
CPE_PRODUCT=	py${PORTNAME}

.include <bsd.port.mk>
