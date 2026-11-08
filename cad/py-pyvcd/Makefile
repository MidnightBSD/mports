PORTNAME=	pyvcd
DISTVERSION=	0.5.1
CATEGORIES=	cad python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python VCD file support
WWW=		https://pyvcd.readthedocs.io/en/latest/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build>=0.9.13<1.0:devel/py-uv-build@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=9,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=2.0:devel/py-pytest-cov@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517 pytest

NO_ARCH=	yes
TEST_ARGS=	--doctest-glob=*.rst

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31200
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>0:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
