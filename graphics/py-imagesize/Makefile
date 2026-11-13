PORTNAME=	imagesize
PORTVERSION=	2.0.1
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Get image size from png/jpeg/jpeg2000/gif file
WWW=		https://github.com/shibukawa/imagesize_py

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

do-test:
	@(cd ${WRKDIR} && ${SETENV} ${TEST_ENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${WRKSRC} \
		${PYTHON_CMD} -m pytest --import-mode=importlib ${WRKSRC}/test)

.include <bsd.port.mk>
