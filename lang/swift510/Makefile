PORTNAME=	swift510
DISTVERSION=	5.10.1
CATEGORIES=	lang
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Swift programming language
WWW=		https://www.swift.org/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/swift/LICENSE.txt

ONLY_FOR_ARCHS=	aarch64 amd64

BUILD_DEPENDS=	bash:shells/bash \
		cmake-core>=3.19.6:devel/cmake-core
LIB_DEPENDS=	libcurl.so:ftp/curl \
		libicuuc.so:devel/icu \
		libuuid.so:misc/libuuid \
		libxml2.so:textproc/libxml2 \
		libzstd.so:archivers/zstd

USES=		libedit ninja:build perl5 pkgconfig python:3.6+ \
		shebangfix sqlite:3
USE_GITHUB=	nodefault
# The common tag which applies to most repos.
tag=		swift-${DISTVERSION}-RELEASE
GH_TUPLE=\
	swiftlang:indexstore-db:${tag}:indexstore_db/indexstore-db \
	swiftlang:llvm-project:${tag}:llvm_project/llvm-project \
	swiftlang:sourcekit-lsp:${tag}:sourcekit_lsp/sourcekit-lsp \
	swiftlang:swift:${tag}:swift/swift \
	swiftlang:swift-cmark:${tag}:swift_cmark/cmark \
	swiftlang:swift-corelibs-foundation:${tag}:swift_corelibs_foundation/swift-corelibs-foundation \
	swiftlang:swift-corelibs-libdispatch:${tag}:swift_corelibs_libdispatch/swift-corelibs-libdispatch \
	swiftlang:swift-corelibs-xctest:${tag}:swift_corelibs_xctest/swift-corelibs-xctest \
	swiftlang:swift-docc:${tag}:swift_docc/swift-docc \
	swiftlang:swift-docc-symbolkit:${tag}:swift_docc_symbolkit/swift-docc-symbolkit \
	swiftlang:swift-driver:${tag}:swift_driver/swift-driver \
	swiftlang:swift-experimental-string-processing:${tag}:swift_experimental_string_processing/swift-experimental-string-processing \
	swiftlang:swift-format:${tag}:swift_format/swift-format \
	swiftlang:swift-llbuild:${tag}:llbuild/llbuild \
	swiftlang:swift-lmdb:${tag}:swift_lmdb/swift-lmdb \
	swiftlang:swift-markdown:${tag}:swift_markdown/swift-markdown \
	swiftlang:swift-package-manager:${tag}:swiftpm/swiftpm \
	swiftlang:swift-stress-tester:${tag}:swift_stress_tester/swift-stress-tester \
	swiftlang:swift-syntax:${tag}:swift_syntax/swift-syntax \
	swiftlang:swift-tools-support-core:${tag}:swift_tools_support_core/swift-tools-support-core
GH_TUPLE+=\
	apple:swift-argument-parser:1.2.3:swift_argument_parser/swift-argument-parser \
	apple:swift-asn1:1.0.0:swift_asn1/swift-asn1 \
	apple:swift-certificates:1.0.1:swift_certificates/swift-certificates \
	apple:swift-collections:1.0.1:swift_collections/swift-collections \
	apple:swift-crypto:3.0.0:swift_crypto/swift-crypto \
	apple:swift-nio:2.31.2:swift_nio/swift-nio \
	apple:swift-system:1.1.1:swift_system/swift-system
GH_TUPLE+=jpsim:Yams:5.0.1:yams/yams
USE_PERL5=	build

SHEBANG_FILES=\
	swift/utils/api_checker/sdk-module-lists/infer-imports.py \
	swift/utils/api_checker/swift-api-checker.py \
	swift/utils/build-script \
	swift/utils/swift-api-dump.py \
	swift-driver/Utilities/build-script-helper.py \
	swiftpm/Utilities/bootstrap \

CONFLICTS=	libdispatch

value_for_aarch64=	aarch64
value_for_amd64=	x86_64
swift_arch=		${value_for_${ARCH}}
# MidnightBSD's base clang targets a FreeBSD triple (e.g. x86_64-unknown-freebsd13.4);
# Swift names its target directories after that triple.
swift_target_triple!=	${CC} -dumpmachine
early_stage_dir=	${WRKDIR}/EarlyStageDir
swift_install_prefix=	${TRUE_PREFIX}/${PORTNAME}
MANDIRS=	${swift_install_prefix}/share/man

SUB_FILES=	pkg-message
SUB_LIST=	SWIFT_INSTALL_PREFIX=${swift_install_prefix}

WRKSRC=		${WRKDIR}/swift-project

PLIST_SUB=	SWIFT_ARCH=${swift_arch} \
		SWIFT_TARGET_TRIPLE=${swift_target_triple}

.include <bsd.port.pre.mk>

pre-patch:
	@${MKDIR} ${WRKSRC}/llbuild/lib/LLBSQLite3

post-patch:
	@${SED} -E -e 's@^python3=python3$$@python3=${PYTHON_CMD}@' -i .bak ${WRKSRC}/swift/utils/build-script-impl

do-build:
	@${MKDIR} ${early_stage_dir}
	${SETENV} \
		CCACHE_ENABLED=${CCACHE_ENABLED} \
		CCACHE_BIN=${CCACHE_BIN} \
		CCACHE_DIR=${CCACHE_DIR} \
		MAKE_JOBS_NUMBER=${MAKE_JOBS_NUMBER} \
		${SH} -x ${FILESDIR}/start-build.sh ${WRKSRC} ${early_stage_dir} \
			${swift_install_prefix} ${WRKDIR}/clang-module-cache

do-install:
	@${FIND} ${early_stage_dir}${swift_install_prefix}/bin -type f -not -name '*.py' -not -name '*.sh' -not -name '*.txt' -exec ${STRIP_CMD} '{}' ';' ; \
	${FIND} ${early_stage_dir}${swift_install_prefix} -type f -name '*.so*' -exec ${STRIP_CMD} '{}' ';' ; \
	cd ${early_stage_dir} ; \
	${COPYTREE_BIN} .${swift_install_prefix}/bin ${FAKE_DESTDIR} ; \
	for subdir in include lib local share; do \
		${COPYTREE_SHARE} .${swift_install_prefix}/$${subdir} ${FAKE_DESTDIR} ; \
	done

.include <bsd.port.post.mk>
