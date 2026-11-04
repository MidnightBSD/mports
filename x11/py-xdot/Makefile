PORTNAME=	xdot
PORTVERSION=	1.6
CATEGORIES=	x11 python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interactive viewer for Graphviz dot files
WWW=		https://pypi.org/project/xdot/

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	dot:graphics/graphviz \
		${PYNUMPY} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR}

USES=		gnome python
USE_PYTHON=	autoplist distutils
USE_GNOME=	cairo gtk30 pygobject3

NO_ARCH=	yes

.include <bsd.port.mk>
