PORTNAME=	uv-build
DISTVERSION=	0.11.16
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	011
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private uv-build 0.11 build backend
WWW=		https://github.com/astral-sh/uv

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.93.0:lang/${RUST_DEFAULT} \
		${PYTHON_PKGNAMEPREFIX}build>=1.0.3:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}installer>=0.7:devel/py-installer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}maturin>=1.0<2.0:devel/py-maturin@${PY_FLAVOR}

USES=		cargo python:3.9+
USE_PYTHON=	allflavors flavors
CARGO_BUILD=	no
CARGO_INSTALL=	no
MAKE_ENV+=	${CARGO_ENV}
_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-uv-build/011

do-build:
	cd ${BUILD_WRKSRC} && ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} -m build --no-isolation --wheel

do-install:
	${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} ${BUILD_WRKSRC}/dist/uv_build-${DISTVERSION}-*.whl

do-test:
	${SETENV} PYTHONPATH=${FAKE_DESTDIR}${_PRIVATE_DIR} ${PYTHON_CMD} ${FILESDIR}/test-provider.py \
		${FAKE_DESTDIR}${_PRIVATE_DIR} ${WRKDIR}/provider-test

.include <bsd.port.mk>
