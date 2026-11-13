PORTNAME=	python-rapidjson
DISTVERSION=	1.25
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper around rapidjson
WWW=		https://github.com/python-rapidjson/python-rapidjson

LICENSE=	mit
LICENSE_FILE=	${WRKDIR}/LICENSE

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytz>0:devel/py-pytz@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>0:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	distutils autoplist pytest

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_WRKSRC=	${WRKSRC}/tests

post-extract:
	@${CAT} ${WRKSRC}/LICENSE ${WRKSRC}/rapidjson/license.txt > ${LICENSE_FILE}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/rapidjson${PYTHON_TAG}.so

.include <bsd.port.mk>
