PORTNAME=	SecretStorage
PORTVERSION=	3.3.1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Store passwords using the SecretService DBus API
WWW=		https://pypi.org/project/SecretStorage/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dbus>=0.84.0:devel/py-dbus@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jeepney>=0.6:devel/py-jeepney@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist cryptography distutils

NO_ARCH=	yes

.include <bsd.port.mk>
