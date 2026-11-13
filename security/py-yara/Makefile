PORTNAME=	yara
PORTVERSION=	4.5.5
DISTVERSIONPREFIX=	v
CATEGORIES=	security python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for yara
WWW=		https://virustotal.github.io/yara/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}yara-python-dex

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libyara.so:security/yara

USE_GITHUB=	yes
GH_ACCOUNT=	VirusTotal
GH_PROJECT=	yara-python

USES=		cpe localbase python python-setuptools:78
CPE_VENDOR=	virustotal
USE_PYTHON=	pep517 autoplist
PEP517_BUILD_CONFIG_SETTING=	-C=--global-option=build -C=--global-option=--dynamic-linking
PEP517_WHEEL_DISTNAME=	yara_python

DO_MAKE_TEST=	${SETENV} ${TEST_ENV} ${PYTHON_CMD} tests.py
TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_TARGET=	# empty

.include <bsd.port.mk>
