# Created by: Randall Hopper <aa8vb@ipass.net>

PORTNAME=	PyOpenGL
PORTVERSION=	3.1.10
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyopengl-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL (and related library) interface for Python
WWW=		https://mcfletch.github.io/pyopengl/

LICENSE=	PyOpenGL
LICENSE_NAME=	PyOpenGL License
LICENSE_FILE=	${WRKSRC}/license.txt
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${PY_PILLOW} \
		${PYTHON_PKGNAMEPREFIX}numpy>=1.16,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=42:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PY_PILLOW} \
		${PYTHON_PKGNAMEPREFIX}numpy>=1.16,1:math/py-numpy@${PY_FLAVOR}

USES=		gl python
USE_GL=		glut
USE_PYTHON=	autoplist pep517

OPTIONS_DEFINE=	TKINTER
OPTIONS_DEFAULT=	TKINTER
TKINTER_DESC=	Build with tkinter for X support

TKINTER_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tkinter>0:x11-toolkits/py-tkinter@${PY_FLAVOR}
TKINTER_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tkinter>0:x11-toolkits/py-tkinter@${PY_FLAVOR}

post-patch:
	@${FIND} ${WRKSRC} -name '*.[ch]' | ${XARGS} ${REINPLACE_CMD} -e \
		's|<malloc\.h>|<stdlib.h>|g'
	@${FIND} ${WRKSRC} -name "*.bak" -delete

.include <bsd.port.mk>
