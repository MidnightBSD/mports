PORTNAME=	quickwit
DISTVERSIONPREFIX=	v
DISTVERSION=	0.9.3
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sub-second search & analytics engine on cloud storage
WWW=		https://quickwit.io/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.96.0:lang/${RUST_DEFAULT} \
		${LOCALBASE}/bin/protoc:devel/protobuf
LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=			cargo pkgconfig
USE_GITHUB=		yes
GH_ACCOUNT=		quickwit-oss
#GH_TUPLE=		quickwit-oss:rust-sasl:daca921:rust_sasl/cargo-crates/sasl2-sys
CARGO_BUILDDEP=	no
RUSTFLAGS+=	--cfg tokio_unstable

CARGO_CARGOLOCK=	${WRKSRC}/${PORTNAME}/Cargo.lock
CARGO_CARGOTOML=	${WRKSRC}/${PORTNAME}/Cargo.toml
CARGO_INSTALL_PATH=	${PORTNAME}/quickwit-cli

NO_TEST=		yes

OPTIONS_DEFINE=		DOCS
OPTIONS_DEFAULT=	DOCS

post-install:
	${MKDIR} ${ETCDIR}
	${INSTALL_DATA}	${WRKSRC}/config/quickwit.yaml ${ETCDIR}/quickwit.yaml.sample
	${RM} -v ${PREFIX}/bin/generate_markdown

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
