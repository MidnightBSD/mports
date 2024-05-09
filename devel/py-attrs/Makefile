PORTNAME=	attrs
PORTVERSION=	23.2.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python attributes without boilerplate
WWW=		https://github.com/python-attrs/attrs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

# Note: sysutils/py-psutil comes from devel/py-pytest-xdist[psutil]
BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-fancy-pypi-readme>=23.2.0:devel/py-hatch-fancy-pypi-readme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

# circurlar loop.  Tests depend on pytest, which depends on this.
NO_TEST=	yes

.include <bsd.port.mk>
