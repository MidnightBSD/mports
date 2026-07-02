PORTNAME=	yara
PORTVERSION=	4.3.1
PORTREVISION=	2
DISTVERSIONPREFIX=	v
CATEGORIES=	security python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for yara
WWW=		https://virustotal.github.io/yara/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}yara-python-dex

LIB_DEPENDS=	libyara.so:security/yara

USE_GITHUB=	yes
GH_ACCOUNT=	VirusTotal
GH_PROJECT=	yara-python

USES=		cpe localbase python
CPE_VENDOR=	virustotal
USE_PYTHON=	distutils autoplist
PYDISTUTILS_BUILDARGS=	--dynamic-linking

DO_MAKE_TEST=	${SETENV} ${TEST_ENV} ${PYTHON_CMD} tests.py
TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_TARGET=	# empty

.include <bsd.port.mk>
