PORTNAME=	numexpr
PORTVERSION=	2.14.2
CATEGORIES=	math python
MASTER_SITES=	PYPI \
		https://github.com/pydata/numexpr/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast numerical array expression evaluator for Python and NumPy
WWW=		https://github.com/pydata/numexpr

LICENSE=	mit bsd3 TWOWAY
LICENSE_COMB=	multi
LICENSE_NAME_TWOWAY=	Eric Blake permissive license
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.txt
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSES/cpuinfo.txt
LICENSE_FILE_TWOWAY=	${WRKSRC}/numexpr/str-two-way.hpp
LICENSE_PERMS_TWOWAY=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=2.0.0,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=1.26.0,1:math/py-numpy@${PY_FLAVOR}

USES=		dos2unix python:3.11+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_WRKSRC=	${WRKDIR}
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${PYTHONPATH} \
		PYTHONSAFEPATH=1 PYTHONDONTWRITEBYTECODE=1
TEST_ARGS=	--pyargs numexpr

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
