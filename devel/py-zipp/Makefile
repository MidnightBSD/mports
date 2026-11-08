PORTNAME=	zipp
PORTVERSION=	4.1.2
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backport of pathlib-compatible object wrapper for zip files
WWW=		https://github.com/jaraco/zipp

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coherent.licensed>0:devel/py-coherent.licensed@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.1:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	allflavors autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
