PORTNAME=	hatch-vcs
PORTVERSION=	0.5.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	hatch_vcs-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hatch plugin for versioning with your preferred VCS
WWW=		https://github.com/ofek/hatch-vcs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.1.0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.1.0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8.0.0:devel/py-setuptools-scm@${PY_FLAVOR}
TEST_DEPENDS=	git:devel/git

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
