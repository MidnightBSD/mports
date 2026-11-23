PORTNAME=	numpy-typing-compat
PORTVERSION=	20260602.2.4
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Static typing compatibility layer for NumPy
WWW=		https://github.com/jorenham/numpy-typing-compat

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build011>=0.11<0.12:devel/py-uv-build011@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=2.4<2.5:math/py-numpy@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist concurrent pep517

_UV_BUILD_PRIVATE?=	${PYTHONPREFIX_LIBDIR}/mports-uv-build/011
MAKE_ENV+=	PYTHONPATH=${_UV_BUILD_PRIVATE} PATH=${_UV_BUILD_PRIVATE}/bin:${PATH}
NO_ARCH=	yes

.include <bsd.port.mk>
