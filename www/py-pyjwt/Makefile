PORTNAME=	pyjwt
PORTVERSION=	2.8.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyJWT-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON Web Token implementation in Python
WWW=		https://pyjwt.readthedocs.io/en/stable/ \
		https://github.com/jpadilla/pyjwt

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}-pyjwt1

CPE_VENDOR=	pyjwt_project

OPTIONS_DEFINE=	CRYPTO
OPTIONS_DEFAULT=CRYPTO

CRYPTO_USE=	PYTHON=cryptography

.include <bsd.port.mk>
