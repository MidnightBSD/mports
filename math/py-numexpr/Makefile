PORTNAME=	numexpr
PORTVERSION=	2.8.7
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast numerical array expression evaluator for Python and NumPy
WWW=		https://github.com/pydata/numexpr

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.13.3,1:math/py-numpy@${PY_FLAVOR}

USES=		dos2unix python:3.9+
USE_PYTHON=	autoplist concurrent distutils

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
