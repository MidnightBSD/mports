PORTNAME=	jaraco.functools
PORTVERSION=	4.6.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	jaraco_functools-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional functools for Python
WWW=		https://github.com/jaraco/jaraco.functools

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.1:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}coherent.licensed>=0:devel/py-coherent.licensed@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}more-itertools>=2.7:devel/py-more-itertools@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	allflavors 	autoplist concurrent pep517 pytest

PEP517_WHEEL_DISTNAME=	${PORTNAME:tl:C|[-_.]+|_|g}

NO_ARCH=	yes
# circular depends on test
NO_TEST=	yes

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}jaraco.classes>=0:devel/py-jaraco.classes@${PY_FLAVOR}

.include <bsd.port.mk>
