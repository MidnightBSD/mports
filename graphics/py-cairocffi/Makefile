# Created by: Dave Cottlehuber <dch@skunkwerks.at>

PORTNAME=	cairocffi
PORTVERSION=	1.7.1
PORTREVISION=	2
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CFFI-based Cairo bindings for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.1.0:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}flit-core>0:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.1.0:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}xcffib>=0.3.2:x11/py-xcffib@${PY_FLAVOR}

USES=		gnome python
USE_GNOME=	cairo
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

NO_TEST=	yes

.include <bsd.port.mk>
