PORTNAME=	hpack
PORTVERSION=	4.2.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure-Python HPACK header encoding
WWW=		https://python-hyper.org/projects/hpack/en/stable/ \
		https://github.com/python-hyper/hpack

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0.46.3:devel/py-wheel@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>=6.152.1<7:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9.0.3,1:devel/py-pytest@${PY_FLAVOR}

USES=		cpe python:3.10+ python-setuptools:modern
USE_PYTHON=	autoplist concurrent pep517 pytest allflavors

NO_ARCH=	yes

CPE_VENDOR=	python

.include <bsd.port.mk>
