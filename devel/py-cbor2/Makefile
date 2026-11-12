PORTNAME=	cbor2
DISTVERSION=	6.2.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CBOR (de)serializer with extensive tag support
WWW=		https://pypi.org/project/cbor2/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-rust>0:devel/py-setuptools-rust@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.4:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=7:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>0:devel/py-hypothesis@${PY_FLAVOR}

USES=		cpe cargo python:3.10+ python-setuptools:78
CPE_VENDOR=	agronholm
USE_PYTHON=	autoplist concurrent pep517 pytest

CARGO_CARGOLOCK=${WRKSRC}/rust/Cargo.lock
CARGO_CARGOTOML=${WRKSRC}/rust/Cargo.toml
CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no
CARGO_SRC_SUBDIR=	rust

TEST_ARGS=	-rsfE --tb=short
TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		TZ=America/New_York PYTHONDONTWRITEBYTECODE=1

MAKE_ENV+=	${CARGO_ENV}

.include <bsd.port.mk>
