PORTNAME=	icecream
DISTVERSION=	2.2.0
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Never use print() to debug again
WWW=		https://pypi.org/project/icecream/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}asttokens>=2.0.1:devel/py-asttokens@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}colorama>=0.3.9:devel/py-colorama@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}executing>=2.2.0:devel/py-executing@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=2.2.0:textproc/py-pygments@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sympy>=1.12:math/py-sympy@${PY_FLAVOR}

USES=		python:3.9+
USE_GITHUB=	yes
USE_PYTHON=	concurrent pep517
GH_ACCOUNT=	gruns
GH_TAGNAME=	v${DISTVERSION}

NO_ARCH=	yes

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m unittest -v

.include <bsd.port.mk>
