PORTNAME=	fontMath
PORTVERSION=	0.9.4
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	fontmath-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of objects for performing math operations on font data
WWW=		https://github.com/robotools/fontMath

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/License.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=42:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fonttools>=3.32.0:print/py-fonttools@${PY_FLAVOR}

USES=		python zip
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
TEST_ARGS=	--doctest-modules --doctest-ignore-import-errors -ra
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

.include <bsd.port.mk>
