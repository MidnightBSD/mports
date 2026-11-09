PORTNAME=	maxminddb
PORTVERSION=	2.8.2
DISTVERSIONPREFIX=	v
CATEGORIES=	net python geography
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python module for reading MaxMind DB file
WWW=		https://github.com/maxmind/MaxMind-DB-Reader-python

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm8>=8.1.0<8.2:devel/py-setuptools-scm8@${PY_FLAVOR}

LIB_DEPENDS=	libmaxminddb.so:net/libmaxminddb

USES=		compiler:c11 localbase python:3.9+ python-setuptools:78
USE_GITHUB=	yes
GH_ACCOUNT=	maxmind
GH_PROJECT=	MaxMind-DB-Reader-python

USE_PYTHON=	autoplist concurrent pep517

SCM8_BUILD_PATH?=	${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/8
MAKE_ENV+=	PYTHONPATH=${SCM8_BUILD_PATH} \
		MAXMINDDB_USE_SYSTEM_LIBMAXMINDDB=1 \
		MAXMINDDB_REQUIRE_EXTENSION=1

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/maxminddb/extension*.so

.include <bsd.port.mk>
