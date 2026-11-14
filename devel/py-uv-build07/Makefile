PORTNAME=	uv-build
DISTVERSION=	0.7.22
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	07
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private uv-build 0.7 build backend
WWW=		https://docs.astral.sh/uv/

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.86.0:lang/${RUST_DEFAULT} \
		${PYTHON_PKGNAMEPREFIX}maturin>=1.0<2.0:devel/py-maturin@${PY_FLAVOR}

LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=		cargo python:3.8+
USE_PYTHON=	pep517
USE_GITHUB=	nodefault
GH_TUPLE=	astral-sh:uv:78d6d1134a50705d336ba209055eb0076feb017d:fixtures

CARGO_BUILD=	no
CARGO_INSTALL=	no
MAKE_ENV+=	${CARGO_ENV} CARGO=${CARGO}
_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-uv-build/07

post-extract:
	@${MKDIR} ${WRKSRC}/scripts/packages
	${CP} -a ${WRKSRC_fixtures}/scripts/packages/built-by-uv ${WRKSRC}/scripts/packages/
	${MV} ${WRKDIR}/astral-tl-6e25b2ee2513d75385101a8ff9f591ef51f314ec ${WRKDIR}/tl-6e25b2ee2513d75385101a8ff9f591ef51f314ec

post-patch:
	${MV} ${WRKSRC}/python/uv_build/__init__.py.orig ${WRKDIR}/uv-build-init.py.orig

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} \
		${BUILD_WRKSRC}/dist/uv_build-${DISTVERSION}*.whl

do-test:
	cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${CARGO} test --offline -p uv-build-backend

.include <bsd.port.mk>
