PORTNAME=	libcst
PORTVERSION=	1.9.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Concrete syntax tree with AST-like properties for Python programs
WWW=		https://github.com/Instagram/LibCST

LICENSE=	mit python Apache-2.0
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE
LICENSE_FILE_python=	${WRKSRC}/LICENSE
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-rust>=0:devel/py-setuptools-rust@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		cargo dos2unix python
USE_PYTHON=	autoplist concurrent pep517

BINARY_ALIAS=	python3=${PYTHON_CMD}
CARGO_BUILD=	no
CARGO_CARGOLOCK=${WRKSRC}/native/Cargo.lock
CARGO_CARGOTOML=${WRKSRC}/native/Cargo.toml
CARGO_INSTALL=	no
# Upstream native/libcst/Cargo.toml requires this for cargo test.
CARGO_TEST_ARGS+=	--no-default-features
# The Rust test harness requires unwinding, including the cdylib's dependencies.
CARGO_TEST_ARGS+=	--config 'profile.release.panic="unwind"'

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}libcst03

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31300 || ${PYTHON_REL} >= 31400
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}pyyaml>=6.0.3:devel/py-pyyaml@${PY_FLAVOR}
.else
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}pyyaml-ft>=8.0.0:devel/py-pyyaml-ft@${PY_FLAVOR}
.endif

MAKE_ENV+=	${CARGO_ENV}

.include <bsd.port.post.mk>
