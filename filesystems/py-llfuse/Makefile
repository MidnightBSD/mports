PORTNAME=	llfuse
PORTVERSION=	1.5.1
CATEGORIES=	filesystems devel python
MASTER_SITES=	PYPI \
		https://github.com/python-llfuse/python-llfuse/releases/download/release-${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for low-level FUSE API
WWW=		https://github.com/python-llfuse/python-llfuse

LICENSE=	lgpl

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		compiler:c++11-lang fuse pkgconfig python
USE_PYTHON=	autoplist concurrent cython pep517

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
