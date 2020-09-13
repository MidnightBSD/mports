# Created by: Dave Cottlehuber <dch@skunkwerks.at>

PORTNAME=	cairocffi
PORTVERSION=	1.1.0
CATEGORIES=	graphics python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CFFI-based Cairo bindings for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.1.0:devel/py-cffi@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.1.0:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}xcffib>=0.3.2:x11/py-xcffib@${PY_FLAVOR}

USES=		gnome python:3.5+
USE_GNOME=	cairo
USE_PYTHON=	distutils autoplist

NO_TEST=	yes

.include <bsd.port.mk>
