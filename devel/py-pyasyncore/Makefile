PORTNAME=	pyasyncore
DISTVERSION=	1.0.5
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Asyncore compatibility module for Python 3.12 and later
WWW=		https://github.com/simonrob/pyasyncore

LICENSE=	python
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.12+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

do-test:
	@cd ${WRKDIR} && ${SETENV} ${TEST_ENV} \
		PYTHONDONTWRITEBYTECODE=1 \
		${PYTHON_CMD} -m unittest discover -s ${WRKSRC}/tests -v

.include <bsd.port.mk>
