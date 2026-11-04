PORTNAME=	rust-analyzer
DISTVERSION=	2025-08-25
PORTREVISION=	3
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Experimental Rust compiler front-end for IDEs
WWW=		https://rust-analyzer.github.io/

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual

USES=		cargo dos2unix
DOS2UNIX_FILES=	${WRKSRC_crate_notify}/src/kqueue.rs
USE_GITHUB=	yes

CARGO_INSTALL_PATH=	crates/rust-analyzer
CARGO_ENV+=	CFG_RELEASE=${DISTVERSION}

LTO_UNSAFE=	yes

# attempts to install rustup toolchains
NO_TEST=	yes

PLIST_FILES=	bin/rust-analyzer
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@cd ${WRKSRC}/docs && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
