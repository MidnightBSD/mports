PORTNAME=	python-dbusmock
PORTVERSION=	0.22.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mock D-Bus objects for tests

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dbus>0:devel/py-dbus@${PY_FLAVOR}

USES=		gnome python
USE_GNOME=	pygobject3
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.mk>
