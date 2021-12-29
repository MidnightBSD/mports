# Created by: Jyun-Yan You <jyyou@cs.nctu.edu.tw>

PORTNAME=	rust
PORTVERSION?=	1.40.0
PORTREVISION?=	0
CATEGORIES=	lang
MASTER_SITES=	https://static.rust-lang.org/dist/:src \
		https://static.rust-lang.org/dist/:rust_bootstrap \
		FREEBSD_LOCAL/tobik/rust:rust_bootstrap \
		https://static.rust-lang.org/dist/:cargo_bootstrap \
		FREEBSD_LOCAL/tobik/rust:cargo_bootstrap \
		https://releases.llvm.org/${COMPILER_RT_VERSION}/:compiler_rt \
		https://github.com/llvm/llvm-project/releases/download/llvmorg-${COMPILER_RT_VERSION}/:compiler_rt
DISTNAME?=	${PORTNAME}c-${PORTVERSION}-src
DISTFILES?=	${NIGHTLY_SUBDIR}${DISTNAME}${EXTRACT_SUFX}:src \
		${_RUSTC_BOOTSTRAP}${BOOTSTRAPS_SUFFIX}.tar.gz:rust_bootstrap \
		${_RUST_STD_BOOTSTRAP}${BOOTSTRAPS_SUFFIX}.tar.gz:rust_bootstrap \
		${_CARGO_BOOTSTRAP}${BOOTSTRAPS_SUFFIX}.tar.gz:cargo_bootstrap \
		${DISTFILES_${ARCH}}
DISTFILES_armv6=	compiler-rt-${COMPILER_RT_VERSION}.src.tar.xz:compiler_rt
DISTFILES_armv7=	compiler-rt-${COMPILER_RT_VERSION}.src.tar.xz:compiler_rt
DIST_SUBDIR?=	rust
EXTRACT_ONLY?=	${DISTFILES:N*\:*bootstrap:C/:.*//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Language with a focus on memory safety and concurrency

LICENSE=	apache2 mit
LICENSE_COMB=	dual

FAKE_OPTS=	trueprefix
NO_TEST=	yes

BUILD_DEPENDS=	cmake:devel/cmake \
		gmake:devel/gmake
LIB_DEPENDS=	libcurl.so:ftp/curl \
		libgit2.so:devel/libgit2 \
		libssh2.so:security/libssh2

USES=		libedit pkgconfig python:build ssl tar:xz

ONLY_FOR_ARCHS?=	amd64 i386
ONLY_FOR_ARCHS_REASON=	requires prebuilt bootstrap compiler

CONFLICTS_INSTALL?=	rust-nightly

EXTRA_PATCHES+=		${EXTRA_PATCHES_${ARCH}}
EXTRA_PATCHES_armv6=	${PATCHDIR}/extra-patch-arm-compiler-rt
EXTRA_PATCHES_armv7=	${PATCHDIR}/extra-patch-arm-compiler-rt

PLIST_FILES=	lib/rustlib/components \
		lib/rustlib/rust-installer-version

OPTIONS_DEFINE=	DOCS GDB SOURCES
GDB_DESC=	Install ports gdb (necessary for debugging rust programs)
SOURCES_DESC=	Install source files

DOCS_VARS_OFF=		_RUST_BUILD_DOCS=false
DOCS_VARS=		_RUST_BUILD_DOCS=true
GDB_RUN_DEPENDS=	${LOCALBASE}/bin/gdb:devel/gdb

# See WRKSRC/src/stage0.txt for the date and version values.
BOOTSTRAPS_DATE?=		2019-11-07
RUST_BOOTSTRAP_VERSION?=	1.39.0
CARGO_BOOTSTRAP_VERSION?=	0.40.0
COMPILER_RT_VERSION?=		9.0.0


BOOTSTRAPS_SUFFIX?=		${BOOTSTRAPS_SUFFIX_${ARCH}}

CARGO_VENDOR_DIR?=		${WRKSRC}/vendor

# Rust's target arch string might be different from *BSD arch strings
_RUST_ARCH_amd64=	x86_64
_RUST_ARCH_i386=	i686
_RUST_TARGET=		${_RUST_ARCH_${ARCH}:U${ARCH}}-unknown-freebsd
_LLVM_TARGET=		${ARCH:C/armv.*/ARM/:S/aarch64/AArch64/:S/powerpc64/PowerPC/}

_RUSTC_BOOTSTRAP=	${BOOTSTRAPS_DATE_${ARCH}:U${BOOTSTRAPS_DATE}}/rustc-${RUST_BOOTSTRAP_VERSION_${ARCH}:U${RUST_BOOTSTRAP_VERSION}}-${_RUST_TARGET}
_RUST_STD_BOOTSTRAP=	${BOOTSTRAPS_DATE_${ARCH}:U${BOOTSTRAPS_DATE}}/rust-std-${RUST_BOOTSTRAP_VERSION_${ARCH}:U${RUST_BOOTSTRAP_VERSION}}-${_RUST_TARGET}
_CARGO_BOOTSTRAP=	${BOOTSTRAPS_DATE_${ARCH}:U${BOOTSTRAPS_DATE}}/cargo-${CARGO_BOOTSTRAP_VERSION_${ARCH}:U${CARGO_BOOTSTRAP_VERSION}}-${_RUST_TARGET}

.include <bsd.port.pre.mk>

.ifdef QEMU_EMULATING
IGNORE=	fails to build with qemu-user-static
.endif

X_PY_ENV=	HOME="${WRKDIR}" \
		LIBGIT2_SYS_USE_PKG_CONFIG=1 \
		LIBSSH2_SYS_USE_PKG_CONFIG=1 \
		OPENSSL_DIR="${OPENSSLBASE}"
X_PY_CMD=	${PYTHON_CMD} ${WRKSRC}/x.py

post-extract:
	@${MKDIR} ${WRKSRC}/build/cache/${BOOTSTRAPS_DATE_${ARCH}:U${BOOTSTRAPS_DATE}}
	${LN} -sf ${DISTDIR}/${DIST_SUBDIR}/${_RUSTC_BOOTSTRAP}${BOOTSTRAPS_SUFFIX}.tar.gz \
		${WRKSRC}/build/cache/${_RUSTC_BOOTSTRAP}.tar.gz
	${LN} -sf ${DISTDIR}/${DIST_SUBDIR}/${_RUST_STD_BOOTSTRAP}${BOOTSTRAPS_SUFFIX}.tar.gz \
		${WRKSRC}/build/cache/${_RUST_STD_BOOTSTRAP}.tar.gz
	${LN} -sf ${DISTDIR}/${DIST_SUBDIR}/${_CARGO_BOOTSTRAP}${BOOTSTRAPS_SUFFIX}.tar.gz \
		${WRKSRC}/build/cache/${_CARGO_BOOTSTRAP}.tar.gz
.if ${ARCH} == armv6 || ${ARCH} == armv7
	${LN} -sf ${WRKDIR}/compiler-rt-${COMPILER_RT_VERSION}.src ${WRKSRC}/src/llvm-project/compiler-rt
.endif

post-patch:
	@${REINPLACE_CMD} 's,gdb,${LOCALBASE}/bin/gdb,' ${WRKSRC}/src/etc/rust-gdb
	@${ECHO_MSG} "Canonical bootstrap date and version before patching:"
	@${GREP} -E '^(date|rustc|cargo)' ${WRKSRC}/src/stage0.txt
# If we override the versions and date of the bootstraps (for instance
# on aarch64 where we provide our own bootstraps), we need to update
# places where they are recorded.
	@${REINPLACE_CMD} -e 's,^date:.*,date: ${BOOTSTRAPS_DATE_${ARCH}:U${BOOTSTRAPS_DATE}},' \
		-e 's,^rustc:.*,rustc: ${RUST_BOOTSTRAP_VERSION_${ARCH}:U${RUST_BOOTSTRAP_VERSION}},' \
		-e 's,^cargo:.*,cargo: ${CARGO_BOOTSTRAP_VERSION_${ARCH}:U${CARGO_BOOTSTRAP_VERSION}},' \
		${WRKSRC}/src/stage0.txt
	@${ECHO_MSG} "Bootstrap date and version after patching:"
	@${GREP} -E '^(date|rustc|cargo)' ${WRKSRC}/src/stage0.txt
# Disable vendor checksums
	@${REINPLACE_CMD} 's,"files":{[^}]*},"files":{},' \
		${CARGO_VENDOR_DIR}/*/.cargo-checksum.json

post-patch-SOURCES-off:
# Mimic tools in config.toml with just src excluded
	@${REINPLACE_CMD} -e 's/config.tools.*"src".*/false;/' \
		${WRKSRC}/src/bootstrap/install.rs

.if defined(WITH_CCACHE_BUILD) && !defined(NO_CCACHE) && !defined(NOCCACHE)
CCACHE_VALUE=	"${CCACHE_WRAPPER_PATH:C,/libexec/ccache$,,}/bin/ccache"
.else
CCACHE_VALUE=	false
.endif

do-configure:
	${SED} -E \
		-e 's,%PREFIX%,${TRUE_PREFIX},' \
		-e 's,%SYSCONFDIR%,${TRUE_PREFIX}/etc,' \
		-e 's,%MANDIR%,${MANPREFIX}/man,' \
		-e 's,%PYTHON_CMD%,${PYTHON_CMD},' \
		-e 's,%CHANNEL%,${PKGNAMESUFFIX:Ustable:S/^-//},' \
		-e 's,%TARGET%,${_RUST_TARGET},' \
		-e 's,%CCACHE%,${CCACHE_VALUE},' \
		-e 's,%CC%,${CC},' \
		-e 's,%CXX%,${CXX},' \
		-e 's,%DOCS%,${_RUST_BUILD_DOCS},' \
		< ${FILESDIR}/config.toml \
		> ${WRKSRC}/config.toml
# no need to build a crosscompiler for these targets
	@${REINPLACE_CMD} -e 's,%CC%,${CC},g' \
		${WRKSRC}/src/librustc_llvm/build.rs \
		${WRKSRC}/src/bootstrap/native.rs

do-build:
#	${CP} ${PORTSDIR}/Templates/config.guess ${WRKSRC}/vendor/lzma-sys/xz-5.2.3/build-aux/config.guess
#	${CP} ${PORTSDIR}/Templates/config.sub ${WRKSRC}/vendor/lzma-sys/xz-5.2.3/build-aux/config.sub
	cd ${WRKSRC} && \
	${SETENV} ${X_PY_ENV} \
	${X_PY_CMD} build \
		--verbose \
		--config ./config.toml \
		--jobs ${MAKE_JOBS_NUMBER}

do-install:
	cd ${WRKSRC} && \
	${SETENV} ${X_PY_ENV} \
		DESTDIR=${FAKE_DESTDIR} \
	${X_PY_CMD} 'install' \
		--verbose \
		--config ./config.toml \
		--jobs ${MAKE_JOBS_NUMBER}

# In post-install, we use the manifests generated during Rust install
# to in turn generate the PLIST. We do that, instead of the regular
# `pkg-plist`, because several libraries have a computed filename based
# on the absolute path of the source files. As it is user-specific, we
# can't know their filename in advance.
#
# Both rustc and Cargo components install the same README.md and LICENSE
# files. The install process backs up the first copy to install the
# second. Thus here, we need to remove those backups. We also need to
# dedup the entries in the generated PLIST, because both components'
# manifests list them.
#
# We fix manpage entries in the generated manifests because Rust
# installs them uncompressed but the Ports framework compresses them.
post-install:
	for f in ${STAGEDIR}${PREFIX}/lib/rustlib/manifest-*; do \
	    ${REINPLACE_CMD} -i '' -E \
	        -e 's|:${FAKE_DESTDIR}|:|' \
	        -e 's|(man/man[1-9]/.*\.[0-9])|\1.gz|' \
	        "$$f"; \
	    ${ECHO_CMD} "$${f#${FAKE_DESTDIR}}" >> ${TMPPLIST}; \
	    ${AWK} '\
	        /^file:/ { \
	            file=$$0; \
	            sub(/^file:/, "", file); \
	            print file; \
	        } \
	        /^dir:/ { \
	            dir=$$0; \
	            sub(/^dir:/, "", dir); \
	            system("find ${FAKE_DESTDIR}" dir " -type f | ${SED} -E -e \"s|${FAKE_DESTDIR}||\""); \
	        }' \
	        "$$f" >> ${TMPPLIST}; \
	done
	-${RM} ${STAGEDIR}${PREFIX}/share/doc/rust/*.old
	${SORT} -u < ${TMPPLIST} > ${TMPPLIST}.uniq
	${MV} ${TMPPLIST}.uniq ${TMPPLIST}
	-${RM} \
	    ${STAGEDIR}${PREFIX}/lib/rustlib/install.log \
	    ${STAGEDIR}${PREFIX}/lib/rustlib/uninstall.sh
# FIXME: Static libraries in lib/rustlib/*/lib/*.rlib are not stripped,
# but they contain non-object files which make strip(1) unhappy.
	@${FIND} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin -exec ${FILE} -i {} + | ${AWK} -F: \
		'/executable|sharedlib/ { print $$1 }' | ${XARGS} ${STRIP_CMD}

# Note that make test does not work when rust is already installed.
do-test:
	cd ${WRKSRC} && \
	${SETENV} ${X_PY_ENV} \
		ALLOW_NONZERO_RLIMIT_CORE=1 \
	${X_PY_CMD} test \
		--verbose \
		--config ./config.toml \
		--jobs ${MAKE_JOBS_NUMBER}

.if !defined(_RUST_MAKESUM_GUARD)
makesum:
	${MAKE} -D_RUST_MAKESUM_GUARD makesum ARCH=${ONLY_FOR_ARCHS:O:[1]} DISTINFO_FILE=${DISTINFO_FILE}.tmp
.for arch in ${ONLY_FOR_ARCHS:O:[2..-1]}
	${MAKE} -D_RUST_MAKESUM_GUARD makesum ARCH=${arch} DISTINFO_FILE=${DISTINFO_FILE}.${arch}
	${GREP} ${_RUST_ARCH_${arch}:U${arch}} ${DISTINFO_FILE}.${arch} >> ${DISTINFO_FILE}.tmp
.for file in ${DISTFILES_${arch}}
	${GREP} ${file:S,:, ,:[1]} ${DISTINFO_FILE}.${arch} >> ${DISTINFO_FILE}.tmp
.endfor
	${RM} ${DISTINFO_FILE}.${arch}
.endfor
	${AWK} '!seen[$$0]++' ${DISTINFO_FILE}.tmp > ${DISTINFO_FILE}
	${RM} ${DISTINFO_FILE}.tmp
.endif

.include <bsd.port.post.mk>
