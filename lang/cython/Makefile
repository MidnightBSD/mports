PORTNAME=	cython
PORTVERSION=	0.29.37
PORTREVISION=	1
CATEGORIES=	lang python
MASTER_SITES=	PYPI \
		https://github.com/cython/cython/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Cython-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compiler for Writing C Extensions for the Python Language
WWW=		https://cython.org/ \
		https://github.com/cython/cython

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		compiler:c11 python:2.7+
USE_PYTHON=	allflavors autoplist concurrent distutils

CONFLICTS_INSTALL=	py*-cython-devel py*-cython3 # bin/cygdb bin/cython bin/cythonize

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/Cython \
		-name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
