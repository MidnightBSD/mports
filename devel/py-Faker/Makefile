PORTNAME=	Faker
DISTVERSION=	15.1.1
PORTREVISION=	2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python package that generates fake data for you
WWW=		https://github.com/joke2k/faker

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-dateutil>=2.4:devel/py-python-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=3.10.0.1:devel/py-typing-extensions@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}freezegun>0:devel/py-freezegun@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pillow>0:graphics/py-pillow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}random2>0:math/py-random2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}validators>0:devel/py-validators@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils pytest

CONFLICTS_INSTALL=	rubygem-faker

NO_ARCH=	yes

.include <bsd.port.mk>
