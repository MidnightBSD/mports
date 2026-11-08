PORTNAME=	websocket-client
DISTVERSION=	1.8.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	websocket_client-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Websocket client for python
WWW=		https://github.com/websocket-client/websocket-client

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}websockets>0:devel/py-websockets@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist pep517 pytest

TEST_WRKSRC=	${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_ENV+=	PYTHONDONTWRITEBYTECODE=1

NO_ARCH=	yes

OPTIONS_DEFINE=		OPTIONAL
OPTIONS_DEFAULT=	OPTIONAL

OPTIONAL_DESC=	SOCKS proxy support and performance boost

OPTIONAL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-socks>0:net/py-python-socks@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}wsaccel>0:www/py-wsaccel@${PY_FLAVOR}

do-test:
	cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} ${FILESDIR}/run-tests.py ${TEST_ARGS:NDESTDIR=*}

.include <bsd.port.mk>
