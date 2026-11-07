PORTNAME=	astroid
PORTVERSION=	4.1.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/pylint-dev/astroid/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstract syntax tree for Python with inference support
WWW=		https://pylint.readthedocs.io/projects/astroid/en/latest/ \
		https://github.com/pylint-dev/astroid

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0.37.1:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
# Upstream NumPy/Pydantic inference and namespace-package tests fail.
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
