PORTNAME=	cbor2
PORTVERSION=	5.4.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure Python CBOR (de)serializer with extensive tag support
WWW=		https://pypi.org/project/cbor2/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=1.7.0:devel/py-setuptools-scm@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_TEST=	yes

.include <bsd.port.mk>
