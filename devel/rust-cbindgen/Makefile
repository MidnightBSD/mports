PORTNAME=	cbindgen
DISTVERSION=	0.24.3
CATEGORIES=	devel
MASTER_SITES=	CRATESIO
PKGNAMEPREFIX=	rust-
# XXX Teach USES=cargo to have proper default
DISTFILES=	${CARGO_DIST_SUBDIR}/${DISTNAME}${CARGO_CRATE_EXT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate C bindings from Rust code
WWW=		https://github.com/eqrion/cbindgen

LICENSE=	MPL20

RUN_DEPENDS=	cargo:lang/${RUST_DEFAULT}

USES=		cargo
PLIST_FILES=	bin/${PORTNAME}

NO_TEST=	yes

.include <bsd.port.mk>
