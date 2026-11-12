PORTNAME=	shaperglot
PORTVERSION=	1.2.2
DISTVERSIONPREFIX=	v
CATEGORIES=	x11-fonts python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test font files for OpenType language support
WWW=		https://github.com/googlefonts/shaperglot/tree/main/shaperglot-py \
		https://github.com/googlefonts/shaperglot

LICENSE=	Apache-2.0

BUILD_DEPENDS=	protoc:devel/protobuf \
		${PYTHON_PKGNAMEPREFIX}maturin>=1.9.1<2.0:devel/py-maturin@${PY_FLAVOR}

USES=		cargo python
USE_PYTHON=	autoplist concurrent pep517

CARGO_BUILD=	no
CARGO_CARGOLOCK=	${WRKSRC}/../Cargo.lock
CARGO_INSTALL=	no
WRKSRC_SUBDIR=	shaperglot-py

USE_GITHUB=	yes
GH_ACCOUNT=	googlefonts

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/cargo-crates/google-fonts-languages-0.7.11/build.rs

MAKE_ENV+=	${CARGO_ENV}

.include <bsd.port.mk>
