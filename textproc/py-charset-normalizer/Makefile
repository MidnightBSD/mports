PORTNAME=	charset-normalizer
PORTVERSION=	3.5.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI \
		https://github.com/jawah/charset_normalizer/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	charset_normalizer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Real First Universal Charset Detector
WWW=		https://charset-normalizer.readthedocs.io/en/latest/ \
		https://github.com/Ousret/charset_normalizer

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python python-setuptools:78
USE_PYTHON=	allflavors autoplist concurrent pep517 pytest

NO_ARCH=	yes

MAKE_ENV=	CHARSET_NORMALIZER_USE_CYTHON=0

.include <bsd.port.mk>
