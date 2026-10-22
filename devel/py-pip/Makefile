PORTNAME=	pip
PORTVERSION=	26.2.2
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for installing and managing Python packages
WWW=		https://pip.pypa.io/en/latest/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.11<4:devel/py-flit-core@${PY_FLAVOR}

USES=		cpe python:3.10+ shebangfix
CPE_VENDOR=	pypa
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	pypa

SHEBANG_FILES=	src/pip/__init__.py

# DOCS disabled: upstream dropped setup.py (build_sphinx is gone) and the docs
# now require sphinx ~= 7.0 and towncrier < 24 (textproc/py-sphinx is 5.3.0,
# textproc/py-towncrier is 25.x, which is incompatible with
# sphinxcontrib-towncrier).
# OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
