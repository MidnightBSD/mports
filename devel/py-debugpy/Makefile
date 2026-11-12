PORTNAME=	debugpy
PORTVERSION=	1.8.22
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the Debug Adapter Protocol for Python
WWW=		https://github.com/microsoft/debugpy

LICENSE=	Apache-2.0 bsd3 epl mit MIT-CMU python
LICENSE_COMB=	multi
LICENSE_NAME_MIT-CMU=	MIT Carnegie Mellon University
LICENSE_FILE_mit=	${WRKSRC}/LICENSE
LICENSE_FILE_Apache-2.0=	${WRKSRC}/src/debugpy/ThirdPartyNotices.txt
LICENSE_FILE_bsd3=	${WRKSRC}/src/debugpy/ThirdPartyNotices.txt
LICENSE_FILE_epl=	${WRKSRC}/src/debugpy/ThirdPartyNotices.txt
LICENSE_FILE_MIT-CMU=	${WRKSRC}/src/debugpy/ThirdPartyNotices.txt
LICENSE_FILE_python=	${WRKSRC}/src/debugpy/ThirdPartyNotices.txt
LICENSE_PERMS_MIT-CMU=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		dos2unix python:3.10+
USE_PYTHON=	autoplist concurrent cython pep517

MAKE_ENV+=	REQUIRE_CYTHON_BUILD=1

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
