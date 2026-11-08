PORTNAME=	uv-build
DISTVERSION=	0.13.7
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UV: Build backend
WWW=		https://astral.sh/ \
		https://docs.astral.sh/uv/ \
		https://github.com/astral-sh/uv

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.97.0:lang/${RUST_DEFAULT} \
		${PYTHON_PKGNAMEPREFIX}maturin>=1.0<2.0:devel/py-maturin@${PY_FLAVOR}

USES=		cargo python
USE_PYTHON=	autoplist pep517

# Matching release fixtures omitted from the PyPI source distribution.
USE_GITHUB=	nodefault
GH_TUPLE=	astral-sh:uv:316c827e058c16b71d5c507a20729c2995a7bcce:fixtures

CARGO_BUILD=	no
CARGO_INSTALL=	no

MAKE_ENV+=	${CARGO_ENV}

post-extract:
	@${MKDIR} ${WRKSRC}/test/packages
	${CP} -a ${WRKSRC_fixtures}/test/packages/built-by-uv ${WRKSRC}/test/packages/

.include <bsd.port.mk>
