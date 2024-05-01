PORTNAME=	pyclipper
PORTVERSION=	1.3.0p5
CATEGORIES=	math python
MASTER_SITES=	PYPI/source/p/pyclipper
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-${PORTVERSION:S/p/.post/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cython wrapper for the C++ translation of Clipper library
WWW=		https://github.com/greginvm/pyclipper

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=1.11.1:devel/py-setuptools-scm@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils cython autoplist pytest

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/pyclipper/_pyclipper${PYTHON_EXT_SUFFIX}.so

.include <bsd.port.mk>
