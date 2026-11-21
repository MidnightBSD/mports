PORTNAME=	fsspec-xrootd
PORTVERSION=	0.5.4
CATEGORIES=	filesystems devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	fsspec_xrootd-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XRootD implementation for fsspec
WWW=		https://scikit-hep.org/fsspec-xrootd/ \
		https://github.com/scikit-hep/fsspec-xrootd

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm9>=9.2.2:devel/py-setuptools-scm9@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fsspec>=0:filesystems/py-fsspec@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

MAKE_ENV+=	PYTHONPATH=${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/9

.include <bsd.port.mk>
