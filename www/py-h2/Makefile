PORTNAME=	h2
PORTVERSION=	4.4.1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure-Python HTTP/2 protocol implementation
WWW=		https://python-hyper.org/projects/hyper-h2/en/stable/ \
		https://github.com/python-hyper/h2

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0.46.3:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hpack>=4.2<5:www/py-hpack@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hyperframe>=6.1<7:www/py-hyperframe@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hypothesis>=6.119.4<7:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.3.3,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:modern
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

.include <bsd.port.mk>
