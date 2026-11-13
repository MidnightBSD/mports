PORTNAME=	pytest-randomly
DISTVERSION=	5.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pytest plugin to randomly order tests and control random.seed
WWW=		https://github.com/pytest-dev/pytest-randomly

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build012>=0.12.1<0.13:devel/py-uv-build012@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

_UV_BUILD_PRIVATE?=	${PYTHONPREFIX_LIBDIR}/mports-uv-build/012
MAKE_ENV+=	PYTHONPATH=${_UV_BUILD_PRIVATE} PATH=${_UV_BUILD_PRIVATE}/bin:${PATH}

.include <bsd.port.mk>
