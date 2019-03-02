# $MidnightBSD$

PORTNAME=	backports.functools_lru_cache
PORTVERSION=	1.5
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backport of the lru_cache function from Python 3.3's functools

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=1.15.0:devel/py-setuptools_scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}backports>=0:devel/py-backports@${PY_FLAVOR}

NO_ARCH=	yes
USE_PYTHON=	autoplist distutils
USES=		python:2.7

POST_PLIST=	trim-backports-namespace

post-install:
	@${RM} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/backports/__init__.py*

trim-backports-namespace:
	@${REINPLACE_CMD} '/backports\/__init__.py*/d' ${TMPPLIST}

.include <bsd.port.mk>
