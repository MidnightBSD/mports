PORTNAME=	Faker
DISTVERSION=	17.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python package that generates fake data for you
WWW=		https://github.com/joke2k/faker

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-dateutil>=2.4:devel/py-python-dateutil@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}freezegun>0:devel/py-freezegun@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pillow>0:graphics/py-pillow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}random2>0:math/py-random2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}validators>0:devel/py-validators@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent distutils pytest

CONFLICTS_INSTALL=	rubygem-faker

NO_ARCH=	yes

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		PYTHONDONTWRITEBYTECODE=1
TEST_WRKSRC=	${WRKDIR}
TEST_ARGS=	-c ${WRKSRC}/setup.cfg ${WRKSRC}/tests --import-mode=importlib --verbose

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 30800
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=3.10.0.1:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
