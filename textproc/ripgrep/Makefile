PORTNAME=	ripgrep
DISTVERSION=	15.1.0
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line search tool

LICENSE=	mit unlicense
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_unlicense=	${WRKSRC}/UNLICENSE

USES=		cargo cpe
CPE_VENDOR=	${PORTNAME}_project
USE_GITHUB=	yes
GH_ACCOUNT=	BurntSushi

CARGO_CRATES=	aho-corasick-1.1.3 \
		anyhow-1.0.100 \
		arbitrary-1.4.2 \
		bstr-1.12.0 \
		cc-1.2.41 \
		cfg-if-1.0.4 \
		crossbeam-channel-0.5.15 \
		crossbeam-deque-0.8.6 \
		crossbeam-epoch-0.9.18 \
		crossbeam-utils-0.8.21 \
		derive_arbitrary-1.4.2 \
		encoding_rs-0.8.35 \
		encoding_rs_io-0.1.7 \
		find-msvc-tools-0.1.4 \
		getrandom-0.3.4 \
		glob-0.3.3 \
		globset-0.4.18 \
		grep-0.4.1 \
		grep-cli-0.1.12 \
		grep-matcher-0.1.8 \
		grep-pcre2-0.1.9 \
		grep-printer-0.3.1 \
		grep-regex-0.1.14 \
		grep-searcher-0.1.16 \
		ignore-0.4.24 \
		itoa-1.0.15 \
		jobserver-0.1.34 \
		lexopt-0.3.1 \
		libc-0.2.177 \
		log-0.4.28 \
		memchr-2.7.6 \
		memmap2-0.9.9 \
		pcre2-0.2.11 \
		pcre2-sys-0.2.10 \
		pkg-config-0.3.32 \
		proc-macro2-1.0.101 \
		quote-1.0.41 \
		r-efi-5.3.0 \
		regex-1.12.2 \
		regex-automata-0.4.13 \
		regex-syntax-0.8.8 \
		ryu-1.0.20 \
		same-file-1.0.6 \
		serde-1.0.228 \
		serde_core-1.0.228 \
		serde_derive-1.0.228 \
		serde_json-1.0.145 \
		shlex-1.3.0 \
		syn-2.0.107 \
		termcolor-1.4.1 \
		textwrap-0.16.2 \
		tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
		tikv-jemallocator-0.6.1 \
		unicode-ident-1.0.20 \
		walkdir-2.5.0 \
		wasip2-1.0.1+wasi-0.2.4 \
		winapi-util-0.1.11 \
		windows-link-0.2.1 \
		windows-sys-0.61.2 \
		wit-bindgen-0.46.0

PLIST_FILES=	bin/rg \
		etc/bash_completion.d/rg.bash \
		share/man/man1/rg.1.gz \
		share/fish/vendor_completions.d/rg.fish \
		share/zsh/site-functions/_rg

PORTDOCS=	CHANGELOG.md FAQ.md GUIDE.md

OPTIONS_DEFINE=	DOCS PCRE2
OPTIONS_DEFAULT=PCRE2

PCRE2_DESC=	${PCRE_DESC} version 2
PCRE2_LIB_DEPENDS=	libpcre2-8.so:devel/pcre2
PCRE2_VARS=	CARGO_FEATURES+=pcre2

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/rg
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/man/man1
	${STAGEDIR}${PREFIX}/bin/rg --generate man | \
		${GZIP_CMD} > ${STAGEDIR}${PREFIX}/share/man/man1/rg.1.gz
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/bash_completion.d/
	${STAGEDIR}${PREFIX}/bin/rg --generate complete-bash \
		> ${STAGEDIR}${PREFIX}/etc/bash_completion.d/rg.bash
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/fish/vendor_completions.d/
	${STAGEDIR}${PREFIX}/bin/rg --generate complete-fish \
		> ${STAGEDIR}${PREFIX}/share/fish/vendor_completions.d/rg.fish
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/zsh/site-functions/
	${STAGEDIR}${PREFIX}/bin/rg --generate complete-zsh \
		> ${STAGEDIR}${PREFIX}/share/zsh/site-functions/_rg

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
