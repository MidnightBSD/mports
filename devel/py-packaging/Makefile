PORTNAME=	packaging
PORTVERSION=	23.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core utilities for Python packages
WWW=		https://github.com/pypa/packaging

LICENSE=	apache2 bsd2
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.APACHE
LICENSE_FILE_bsd2=${WRKSRC}/LICENSE.BSD

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

PEP517_BUILD_CMD=	${PYTHON_CMD} -m flit_core.wheel
PEP517_BUILD_DEPEND=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.3:devel/py-flit-core@${PY_FLAVOR}

.include <bsd.port.mk>
