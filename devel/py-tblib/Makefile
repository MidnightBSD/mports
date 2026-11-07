PORTNAME=	tblib
PORTVERSION=	3.2.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Traceback serialization library in Python
WWW=		https://pypi.org/project/tblib/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
