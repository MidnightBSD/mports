PORTNAME=	libevdev
PORTVERSION=	0.11
PORTREVISION=	2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper around the libevdev C library
WWW=		https://pypi.org/project/libevdev/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libevdev.so:devel/libevdev

USES=		python
USE_PYTHON=	autoplist pep517
# pytest
# magus test hard crash

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
