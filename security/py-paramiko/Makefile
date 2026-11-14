PORTNAME=	paramiko
PORTVERSION=	3.5.1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python SSH2 protocol library
WWW=		https://www.paramiko.org/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}bcrypt>=3.2:security/py-bcrypt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cryptography>=3.3:security/py-cryptography@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasn1>=0.1.7:devel/py-pyasn1@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pynacl>=1.5:security/py-pynacl@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}icecream>=0:devel/py-icecream@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}invoke>=0:devel/py-invoke@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-relaxed>=0:devel/py-pytest-relaxed@${PY_FLAVOR}

USES=		cpe python:3.6+
USE_PYTHON=	autoplist distutils pytest

NO_ARCH=	yes

OPTIONS_DEFINE=		GSSAPI
GSSAPI_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gssapi>=1.4.1:security/py-gssapi@${PY_FLAVOR}

.include <bsd.port.mk>
