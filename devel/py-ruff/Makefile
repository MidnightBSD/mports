PORTNAME=	ruff
DISTVERSION=	0.17.3
CATEGORIES=	devel python
#MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extremely fast Python linter and code formatter
WWW=		https://astral.sh/ \
		https://docs.astral.sh/ruff/ \
		https://github.com/astral-sh/ruff

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.97:lang/${RUST_DEFAULT} \
		${PYTHON_PKGNAMEPREFIX}maturin>=1.9.3<2.0:devel/py-maturin@${PY_FLAVOR} \
		${PY_SETUPTOOLS} \
		gmake:devel/gmake
LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=		cargo python
USE_PYTHON=	pep517 autoplist concurrent

USE_GITHUB=	yes
GH_ACCOUNT=	astral-sh

CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no
CARGO_TARGET_DIR=	${WRKSRC}/target

# suggested to the upstream to add an ability to use the external ruff executable, see https://github.com/astral-sh/ruff/issues/11932

MAKE_ENV+=	${CARGO_ENV}

.include <bsd.port.mk>
