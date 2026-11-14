PORTNAME=	sympy
PORTVERSION=	1.14.0
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Library For Symbolic Mathematics
WWW=		https://sympy.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mpmath>=1.1.0<1.4:math/py-mpmath@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>=0:devel/py-hypothesis@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	distutils concurrent autoplist pytest
NO_ARCH=	yes

OPTIONS_DEFINE=	PYGLET
PYGLET_DESC=	Enable plotting support

PYGLET_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyglet1>=1.1.2:graphics/py-pyglet1@${PY_FLAVOR}

# Preserve upstream pytest configuration, including its default marker selection.
do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -v ${TEST_ARGS}

.include <bsd.port.mk>
