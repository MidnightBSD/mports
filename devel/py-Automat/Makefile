PORTNAME=	Automat
PORTVERSION=	20.2.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Finite-state machines in Python
WWW=		https://github.com/glyph/Automat

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}m2r>0:textproc/py-m2r@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=19.2.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR}

# Officially: 2.7, 3.5-3.8
USES=		python
USE_PYTHON=	autoplist concurrent distutils

# Note: We cannot include devel/py-twisted in *_DEPENDS because it depends
# on us for BUILD and RUN.

NO_ARCH=	yes

.include <bsd.port.mk>
