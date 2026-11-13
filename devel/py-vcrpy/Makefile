PORTNAME=	vcrpy
DISTVERSION=	8.3.0
CATEGORIES=	devel www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically mock HTTP interactions to simplify and speed up testing
WWW=		https://github.com/kevin1024/vcrpy

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wrapt>0:devel/py-wrapt@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
