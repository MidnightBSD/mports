PORTNAME=	pandoc
PORTVERSION=	3.1.1
CATEGORIES=	textproc haskell

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Conversion between markup formats
WWW=		https://pandoc.org

LICENSE=	gpl2

USES=		cabal

OPTIONS_DEFINE=		EMBED_DATA

EMBED_DATA_DESC=	Embed data files in binary for relocatable executable
EMBED_DATA_CABAL_FLAGS=	embed_data_files

USE_CABAL=	Glob-0.10.2_3 \
		JuicyPixels-3.3.8 \
		OneTuple-0.4.1.1 \
		QuickCheck-2.14.2 \
		SHA-1.6.4.4 \
		StateVar-1.2.2 \
		aeson-2.1.2.1_1 \
		aeson-pretty-0.8.9_2 \
		ansi-terminal-0.11.4 \
		appar-0.1.8 \
		asn1-encoding-0.9.6_2 \
		asn1-parse-0.9.5 \
		asn1-types-0.3.4 \
		assoc-1.0.2_3 \
		async-2.2.4_2 \
		attoparsec-0.14.4_3 \
		base-compat-0.12.2 \
		base-compat-batteries-0.12.2 \
		base-orphans-0.9.0 \
		base16-bytestring-1.0.2.0 \
		base64-0.4.2.4_2 \
		base64-bytestring-1.2.1.0 \
		basement-0.0.15 \
		bifunctors-5.5.15 \
		bitvec-1.1.3.0 \
		blaze-builder-0.4.2.2_1 \
		blaze-html-0.9.1.2_2 \
		blaze-markup-0.8.2.8_3 \
		byteorder-1.0.4 \
		cabal-doctest-1.0.9_3 \
		case-insensitive-1.2.1.0 \
		cereal-0.5.8.3 \
		citeproc-0.8.1 \
		cmdargs-0.10.21 \
		colour-2.3.6 \
		commonmark-0.2.2 \
		commonmark-extensions-0.2.3.4 \
		commonmark-pandoc-0.2.1.3 \
		comonad-5.0.8_1 \
		conduit-1.3.4.3_1 \
		conduit-extra-1.3.6 \
		connection-0.3.1_1 \
		contravariant-1.5.5 \
		cookie-0.4.6 \
		cryptonite-0.30 \
		data-array-byte-0.1.0.1_1 \
		data-default-0.7.1.1 \
		data-default-class-0.1.2.0 \
		data-default-instances-containers-0.0.1 \
		data-default-instances-dlist-0.0.1 \
		data-default-instances-old-locale-0.0.1 \
		data-fix-0.3.2_4 \
		digest-0.0.1.7 \
		distributive-0.6.2.1_1 \
		dlist-1.0 \
		doclayout-0.4_1 \
		doctemplates-0.11 \
		emojis-0.1.2 \
		file-embed-0.0.15.0 \
		generically-0.1.1 \
		gridtables-0.1.0.0 \
		haddock-library-1.11.0_1 \
		happy-1.20.1.1 \
		hashable-1.4.2.0_1 \
		haskell-lexer-1.1.1 \
		hourglass-0.2.12 \
		hsc2hs-0.68.9 \
		hslua-2.2.1 \
		hslua-aeson-2.2.1 \
		hslua-classes-2.2.0 \
		hslua-cli-1.2.0 \
		hslua-core-2.2.1 \
		hslua-list-1.1.0.1 \
		hslua-marshalling-2.2.1 \
		hslua-module-doclayout-1.0.4 \
		hslua-module-path-1.0.3 \
		hslua-module-system-1.0.3 \
		hslua-module-text-1.0.3.1 \
		hslua-module-version-1.0.3 \
		hslua-module-zip-1.0.0 \
		hslua-objectorientation-2.2.1 \
		hslua-packaging-2.2.1 \
		http-client-0.7.13.1_1 \
		http-client-tls-0.3.6.1 \
		http-types-0.12.3 \
		indexed-traversable-0.1.2.1 \
		indexed-traversable-instances-0.1.1.2_1 \
		integer-logarithms-1.0.3.1_4 \
		iproute-1.7.12 \
		ipynb-0.2_1 \
		jira-wiki-markup-1.5.0 \
		libyaml-0.1.2_1 \
		lpeg-1.0.3 \
		lua-2.2.1 \
		memory-0.18.0 \
		mime-types-0.1.1.0 \
		mono-traversable-1.0.15.3 \
		network-3.1.2.8 \
		network-uri-2.6.4.2 \
		old-locale-1.0.0.7_2 \
		pandoc-3.1.1 \
		pandoc-lua-engine-0.1.1 \
		pandoc-lua-marshal-0.2.1 \
		pandoc-types-1.23 \
		pem-0.2.4 \
		pretty-show-1.10 \
		primitive-0.8.0.0 \
		random-1.2.1.1 \
		resourcet-1.3.0 \
		safe-0.3.19 \
		scientific-0.3.7.0_5 \
		semialign-1.2.0.1_3 \
		semigroupoids-5.3.7_1 \
		skylighting-0.13.2.1 \
		skylighting-core-0.13.2.1 \
		skylighting-format-ansi-0.1 \
		skylighting-format-blaze-html-0.1.1 \
		skylighting-format-context-0.1.0.2 \
		skylighting-format-latex-0.1 \
		socks-0.6.1 \
		split-0.2.3.5 \
		splitmix-0.1.0.4_2 \
		streaming-commons-0.2.2.5 \
		strict-0.4.0.1_4 \
		syb-0.7.2.2 \
		tagged-0.8.7 \
		tagsoup-0.14.8 \
		temporary-1.3 \
		texmath-0.12.6 \
		text-conversions-0.3.1.1 \
		text-short-0.1.5_1 \
		th-abstraction-0.5.0.0 \
		th-compat-0.1.4_2 \
		th-lift-0.8.3 \
		th-lift-instances-0.1.20 \
		these-1.1.1.1_6 \
		time-compat-1.9.6.1_5 \
		tls-1.6.0 \
		transformers-compat-0.7.2 \
		typed-process-0.2.11.0 \
		unicode-collation-0.1.3.3 \
		unicode-data-0.4.0.1_1 \
		unicode-transforms-0.4.0.1_2 \
		uniplate-1.6.13_1 \
		unliftio-core-0.2.1.0_1 \
		unordered-containers-0.2.19.1_1 \
		utf8-string-1.0.2 \
		uuid-types-1.0.5_3 \
		vector-0.13.0.0_3 \
		vector-algorithms-0.9.0.1_2 \
		vector-stream-0.1.0.0_2 \
		witherable-0.4.2_4 \
		x509-1.7.7 \
		x509-store-1.6.9 \
		x509-system-1.6.7 \
		x509-validation-1.6.12 \
		xml-1.3.14_2 \
		xml-conduit-1.9.1.1_2 \
		xml-types-0.3.8 \
		yaml-0.11.11.0 \
		zip-archive-0.4.3 \
		zlib-0.6.3.0_1

HACKAGE_DISTNAME=	pandoc-cli-0.1
CABAL_WRAPPER_SCRIPTS=	${CABAL_EXECUTABLES}

OPTIONS_SUB=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MEMBED_DATA}
# No need to use wrapper scripts when all data is compiled into an executable
.undef CABAL_WRAPPER_SCRIPTS
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == i386 || ${ARCH} == aarch64
# compiler goes out of memory
BUILD_ARGS+=   --disable-optimization
.endif

post-install-EMBED_DATA-off:
	cd ${CABAL_DEPSDIR}/${PORTNAME}-${PORTVERSION} && ${COPYTREE_SHARE} data ${FAKE_DESTDIR}${DATADIR}
post-install:
	${INSTALL_MAN} ${CABAL_DEPSDIR}/${PORTNAME}-${PORTVERSION}/man/pandoc.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

.include <bsd.port.post.mk>
