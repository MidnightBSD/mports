PORTNAME=	pygal
PORTVERSION=	3.1.0
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python SVG graph plotting library
WWW=		https://www.pygal.org/

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-runner>=0:devel/py-pytest-runner@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=0:devel/py-importlib-metadata@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairosvg>=0:graphics/py-cairosvg@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}coveralls>=0:devel/py-coveralls@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lxml>=0:devel/py-lxml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyquery>=0:devel/py-pyquery@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ruff>=0.5.6:devel/py-ruff@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
PLIST_FILES=	${DATADIR_REL}/COPYING.GPL3

post-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${FILESDIR}/COPYING.GPL3 ${DATADIR}/COPYING.GPL3

.include <bsd.port.mk>
