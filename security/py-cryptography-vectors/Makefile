PORTNAME=	cryptography-vectors
PORTVERSION=	50.0.1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	cryptography_vectors-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test vectors for the cryptography package
WWW=		https://cryptography.io/en/latest/development/test-vectors/ \
		https://github.com/pyca/cryptography/tree/main/vectors

LICENSE=	Apache-2.0 bsd3
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE.APACHE
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.BSD

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build012>=0.12.1<0.13:devel/py-uv-build012@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517

MAKE_ENV=	SOURCE_DATE_EPOCH=315532800 # 1980-01-01 00:00:00 UTC
_UV_BUILD_PRIVATE?=	${PYTHONPREFIX_LIBDIR}/mports-uv-build/012
MAKE_ENV+=	PYTHONPATH=${_UV_BUILD_PRIVATE} PATH=${_UV_BUILD_PRIVATE}/bin:${PATH}
NO_ARCH=	yes

.include <bsd.port.mk>
