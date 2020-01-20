PORTNAME=	llfuse
PORTVERSION=	1.3.3
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for low-level FUSE API

LICENSE=	lgpl

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}contextlib2>0:devel/py-contextlib2@${PY_FLAVOR}

USES=		compiler:c++11-lang fuse pkgconfig python tar:bz2
USE_PYTHON=	autoplist distutils

NO_TEST=	yes

post-install:
	-${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/llfuse.so

.include <bsd.port.mk>
