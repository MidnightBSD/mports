PORTNAME=	maturin
DISTVERSION=	1.16.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
# Workaround to use both the PyPI tarball and the cargo crates.
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build and publish crates with pyo3, rust-cpython and cffi bindings
WWW=		https://github.com/PyO3/maturin

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/license-apache
LICENSE_FILE_mit=	${WRKSRC}/license-mit

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.89:lang/${RUST_DEFAULT} \
		${PYTHON_PKGNAMEPREFIX}setuptools-rust>=1.11.0:devel/py-setuptools-rust@${PY_FLAVOR} \
		${PY_TOMLI} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.36.2:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libzstd.so:archivers/zstd
RUN_DEPENDS=	${PY_TOMLI}

USES=		cargo python python-setuptools:modern
USE_PYTHON=	allflavors autoplist concurrent pep517

# Matching release fixtures omitted from the PyPI source distribution.
USE_GITHUB=	nodefault
GH_TUPLE=	PyO3:maturin:3bec0a32ae2b67ad4fac0194f762f44141e51473:fixtures

# Keep test fixture crate versions from updating the production lockfile.
CARGO_UPDATE_ARGS=	--workspace
CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TARGET_DIR=	${WRKSRC}/target
MAKE_ENV=	${CARGO_ENV}
BINARY_ALIAS=	python3=${PYTHON_CMD}

# NB: There are two options in "pyproject.toml" (= "patchelf" + "zig") but both
#     seem to be a no-op on MidnightBSD at the moment, so they were deliberately
#     not added.

.include <bsd.mport.options.mk>

.if ${ARCH:Mpowerpc*}
CARGO_BUILD_ARGS=	--no-default-features \
			--features=upload,log,human-panic
.endif

post-patch:
	${REINPLACE_CMD} 's|%%PYTHON_VER%%|${PYTHON_VER}|' ${WRKSRC}/maturin/__init__.py

fake-post-install:
	@if [ ! -e ${FAKE_DESTDIR}${PREFIX}/bin/maturin ] && \
		[ -e ${FAKE_DESTDIR}${PREFIX}/bin/maturin-${PYTHON_DEFAULT} ]; then \
		${MV} ${FAKE_DESTDIR}${PREFIX}/bin/maturin-${PYTHON_DEFAULT} \
			${FAKE_DESTDIR}${PREFIX}/bin/maturin; \
	fi

post-extract:
	${CP} -a ${WRKSRC_fixtures}/test-crates ${WRKSRC}/

.include <bsd.port.mk>
