PORTNAME=	pyfakefs
PORTVERSION=	5.7.1
CATEGORIES=	filesystems devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implement a fake file system that mocks the Python file system modules
WWW=		https://pytest-pyfakefs.readthedocs.io/en/stable/ \
		https://github.com/jmcgeheeiv/pyfakefs

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}undefined>=0:devel/py-undefined@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
