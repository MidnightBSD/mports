PORTNAME=	hatch-nodejs-version
DISTVERSION=	0.3.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	hatch_nodejs_version-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hatch plugin for versioning from a package.json file
WWW=		https://github.com/agoose77/hatch-nodejs-version

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0.21.0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0.21.0:devel/py-hatchling@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517 pytest

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

NO_ARCH=	yes

.include <bsd.port.mk>
