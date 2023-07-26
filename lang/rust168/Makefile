PORTNAME=	rust
PORTVERSION?=	1.68.2
PORTREVISION?=	0
CATEGORIES=	lang
MASTER_SITES=	https://static.rust-lang.org/dist/:src \
		https://dev-static.rust-lang.org/dist/:src \
		FREEBSD_LOCAL/rust:bootstrap \
		https://static.rust-lang.org/dist/:bootstrap
DISTNAME?=	${PORTNAME}c-${PORTVERSION}-src
DISTFILES?=	${NIGHTLY_DATE:D${NIGHTLY_DATE}/}${DISTNAME}${EXTRACT_SUFX}:src \
		${_RUSTC_BOOTSTRAP}${EXTRACT_SUFX}:bootstrap \
		${_RUST_STD_BOOTSTRAP}${EXTRACT_SUFX}:bootstrap \
		${_CARGO_BOOTSTRAP}${EXTRACT_SUFX}:bootstrap
DIST_SUBDIR?=	rust
PKGNAMESUFFIX=	168

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Language with a focus on memory safety and concurrency
WWW=		https://www.rust-lang.org/

LICENSE=	apache2 mit
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

BROKEN_MidnightBSD_2.1=		requires 3.x
BROKEN_MidnightBSD_2.2=		requires 3.x

FAKE_OPTS=    trueprefix
NO_TEST=      yes

BUILD_DEPENDS=	cmake:devel/cmake-core
LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		cpe ninja:build pkgconfig python:3.7+,build shebangfix ssl tar:xz

CPE_VENDOR=	rust-lang

MAKE_ENV=	DESTDIR=${FAKE_DESTDIR} \
		LIBGIT2_NO_PKG_CONFIG=1 \
		OPENSSL_DIR="${OPENSSLBASE}"
TEST_ENV=	${MAKE_ENV} \
		ALLOW_NONZERO_RLIMIT_CORE=1

CONFLICTS_INSTALL?=	rust-nightly

# rustc stashes intermediary files in TMPDIR (default /tmp) which
# might cause issues for users that for some reason space limit
# their /tmp.  WRKDIR should have plenty of space.
# ?= to allow users to still overwrite it in make.conf.
TMPDIR?=	${WRKDIR}

OPTIONS_DEFINE=		DOCS GDB SOURCES WASM
OPTIONS_DEFAULT=	SOURCES WASM
.if !defined(NIGHTLY_DATE)
OPTIONS_EXCLUDE=	DOCS # https://github.com/rust-lang/rust/issues/76526
.endif

GDB_DESC=	Install ports gdb (necessary for debugging rust programs)
SOURCES_DESC=	Install source files
WASM_DESC=	Build the WebAssembly target (wasm32-unknown-unknown)

DOCS_VARS=		_RUST_BUILD_DOCS=true
DOCS_VARS_OFF=		_RUST_BUILD_DOCS=false
GDB_RUN_DEPENDS=	${LOCALBASE}/bin/gdb:devel/gdb
SOURCES_VARS=		_COMPONENTS+=rust-src-${_PACKAGE_VERS} \
			_RUST_TOOLS+=src
WASM_VARS=		_COMPONENTS+="rust-analysis-${_PACKAGE_VERS}-wasm32-unknown-unknown rust-std-${_PACKAGE_VERS}-wasm32-unknown-unknown" \
			_RUST_BUILD_WASM=true \
			_RUST_TARGETS+=wasm32-unknown-unknown
WASM_VARS_OFF=		_RUST_BUILD_WASM=false

# See WRKSRC/src/stage0.json for the date and version values
BOOTSTRAPS_DATE?=		2023-02-09
RUST_BOOTSTRAP_VERSION?=	1.67.1


CARGO_VENDOR_DIR?=		${WRKSRC}/vendor

# Rust's target arch string might be different from *BSD arch strings
_RUST_ARCH_amd64=	x86_64
_RUST_ARCH_i386=	i686
_RUST_ARCH_riscv64=	riscv64gc
_RUST_TARGET=		${_RUST_ARCH_${ARCH}:U${ARCH}}-unknown-freebsd
_RUST_TARGETS=		${_RUST_TARGET}
_RUST_TOOLS=		analysis cargo clippy rustfmt

_RUSTC_BOOTSTRAP=	${BOOTSTRAPS_DATE_${ARCH}:U${BOOTSTRAPS_DATE}}/rustc-${RUST_BOOTSTRAP_VERSION_${ARCH}:U${RUST_BOOTSTRAP_VERSION}}-${_RUST_TARGET}
_RUST_STD_BOOTSTRAP=	${BOOTSTRAPS_DATE_${ARCH}:U${BOOTSTRAPS_DATE}}/rust-std-${RUST_BOOTSTRAP_VERSION_${ARCH}:U${RUST_BOOTSTRAP_VERSION}}-${_RUST_TARGET}
_CARGO_BOOTSTRAP=	${BOOTSTRAPS_DATE_${ARCH}:U${BOOTSTRAPS_DATE}}/cargo-${RUST_BOOTSTRAP_VERSION_${ARCH}:U${RUST_BOOTSTRAP_VERSION}}-${_RUST_TARGET}

_PACKAGE_VERS=		${NIGHTLY_DATE:?nightly:${PORTVERSION}}
_COMPONENTS+=		cargo-${_PACKAGE_VERS}-${_RUST_TARGET} \
			clippy-${_PACKAGE_VERS}-${_RUST_TARGET} \
			rustc-${_PACKAGE_VERS}-${_RUST_TARGET} \
			rustfmt-${_PACKAGE_VERS}-${_RUST_TARGET} \
			rust-analysis-${_PACKAGE_VERS}-${_RUST_TARGET} \
			rust-std-${_PACKAGE_VERS}-${_RUST_TARGET}

# https://github.com/bjorn3/rustc_codegen_cranelift/commit/83d470d91c15d0cb5890705291e6ee9e5be8a842
# https://github.com/rust-lang/rustc_codegen_gcc/pull/160
SHEBANG_FILES=		compiler/rustc_codegen_cranelift/scripts/* \
			compiler/rustc_codegen_gcc/*.sh compiler/rustc_codegen_gcc/build_sysroot/*.sh

.include <bsd.port.pre.mk>

MAKE_ENV+=	RUST_BACKTRACE=1

# rls doesn't build on rust nightly
# rls needs 64-bit atomics: it doesn't build on powerpc
.if !defined(NIGHTLY_DATE)
_RUST_TOOLS+=	rls
_COMPONENTS+=	rls-${_PACKAGE_VERS}-${_RUST_TARGET}
.endif

# per https://rust-lang.github.io/rustup/concepts/components.html
# rustc-dev is only usefull on nightly
.if defined(NIGHTLY_DATE)
_COMPONENTS+=	rustc-dev-${_PACKAGE_VERS}-${_RUST_TARGET}
.endif

# If the kernel does not return sane kern.proc.pathname values
# for hardlinks then disable hardlinks in the build to avoid
# intermittent "can't find crate for `std`" build failures,
# c.f. PR248184
#
# XXX: Avoiding OSVERSION since it is derived from userland but
# the running kernel might still be newer with sane behavior
# anyway...
.if exists(${PATCHDIR}/no-hardlinks)
EXTRA_PATCHES+=		${PATCHDIR}/no-hardlinks
.endif

.ifdef QEMU_EMULATING
IGNORE=	fails to build with qemu-user-static
.endif

.if make(makesum)
DISTFILES:=	${DISTFILES:M*\:src} \
		${ONLY_FOR_ARCHS:O:@_arch@${:!${MAKE} ARCH=${_arch} -V'DISTFILES:N*\:src'!}@}
.endif

post-patch:
	@${REINPLACE_CMD} 's,gdb,${LOCALBASE}/bin/gdb,' ${WRKSRC}/src/etc/rust-gdb
.if defined(NIGHTLY_DATE)
	@${REINPLACE_CMD} 's/"rustfmt"/"nothx"/' ${WRKSRC}/src/stage0.json
.endif
# Disable vendor checksums
	@${REINPLACE_CMD} 's,"files":{[^}]*},"files":{},' \
		${CARGO_VENDOR_DIR}/*/.cargo-checksum.json

do-configure:
# Check that the running kernel has COMPAT_FREEBSD11 required by lang/rust post-ino64
	@${SETENV} CC="${CC}" OPSYS="FreeBSD" OSVERSION="1204000" WRKDIR="${WRKDIR}" \
		${SH} ${SCRIPTSDIR}/rust-compat11-canary.sh
.for _component in cargo rust-std rustc
	@cd ${WRKDIR}/${_component}-*-freebsd && \
		${SH} install.sh --prefix=${WRKDIR}/bootstrap --verbose
.endfor
	@${ECHO_CMD} 'changelog-seen=2' > ${WRKSRC}/config.toml
	@${ECHO_CMD} '[build]' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'build-dir="${WRKDIR}/_build"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'build-stage=2' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'doc-stage=2' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'test-stage=2' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'vendor=true' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'extended=true' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'python="${PYTHON_CMD}"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'docs=${_RUST_BUILD_DOCS}' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'verbose=2' >> ${WRKSRC}/config.toml
.if defined(NIGHTLY_DATE)
	@${ECHO_CMD} 'profiler=true' >> ${WRKSRC}/config.toml
.endif
	@${ECHO_CMD} 'target=[${_RUST_TARGETS:@.target.@"${.target.}"@:ts,}]' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'cargo="${WRKDIR}/bootstrap/bin/cargo"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'rustc="${WRKDIR}/bootstrap/bin/rustc"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'tools=[${_RUST_TOOLS:@.tool.@"${.tool.}"@:ts,}]' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} '[install]' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'prefix="${PREFIX}"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'sysconfdir="${PREFIX}/etc"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} '[rust]' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'channel="${PKGNAMESUFFIX:Ustable:S/^-//}"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'default-linker="${CC}"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'deny-warnings=false' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'verbose-tests=true' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'lld=${_RUST_BUILD_WASM}' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} '[llvm]' >> ${WRKSRC}/config.toml
.if defined(WITH_CCACHE_BUILD) && !defined(NO_CCACHE)
	@${ECHO_CMD} 'ccache="${CCACHE_BIN}"' >> ${WRKSRC}/config.toml
.else
	@${ECHO_CMD} 'ccache=false' >> ${WRKSRC}/config.toml
.endif
	@${ECHO_CMD} 'ninja=true' >> ${WRKSRC}/config.toml
.for _target in ${_RUST_TARGETS}
	@${ECHO_CMD} '[target.${_target}]' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'ar="${AR}"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'cc="${CC}"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'cxx="${CXX}"' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'linker="${CC}"' >> ${WRKSRC}/config.toml
.endfor
	@${ECHO_CMD} '[dist]' >> ${WRKSRC}/config.toml
	@${ECHO_CMD} 'src-tarball=false' >> ${WRKSRC}/config.toml
.if defined(NIGHTLY_DATE)
# Don't abort if optional tools fail to build
	@${ECHO_CMD} 'missing-tools=true' >> ${WRKSRC}/config.toml
.endif

do-build:
	@cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${PYTHON_CMD} x.py dist --jobs=${MAKE_JOBS_NUMBER}

do-install:
	@cd ${WRKSRC} && \
                ${SETENV} ${MAKE_ENV} DESTDIR=${FAKE_DESTDIR} ${PYTHON_CMD} x.py install --jobs=${MAKE_JOBS_NUMBER}
# We autogenerate the plist file.  We do that, instead of the
# regular pkg-plist, because several libraries have a computed
# filename based on the absolute path of the source files.  As it
# is user-specific, we cannot know their filename in advance.
	-${RM} -r ${DOCSDIR}/*.old \
                ${DOCSDIR}/html/.lock \
                ${DOCSDIR}/html/.stamp \
                ${PREFIX}/lib/rustlib/install.log \
                ${PREFIX}/lib/rustlib/manifest-* \
                ${PREFIX}/lib/rustlib/uninstall.sh
	@${FIND} ${PREFIX}/bin ${PREFIX}/lib \
                ${PREFIX}/libexec -exec ${FILE} -i {} + | \
                ${AWK} -F: '/executable|sharedlib/ { print $$1 }' | ${XARGS} ${STRIP_CMD}
	@${FIND} ${PREFIX} -not -type d | \
                ${SED} -E -e 's,^${FAKE_DESTDIR}${TRUE_PREFIX}/,,' \
                        -e 's,(share/man/man[1-9]/.*\.[0-9]),\1.gz,' >> ${TMPPLIST}

post-install-DOCS-on:
# Ignore any left behind empty directories in case some docs fail
# to build (failures are ignored due to deny-warnings=false).
	@${FIND} ${FAKE_DESTDIR}${DOCSDIR}/html -empty -type d | \
		${SED} 's,^${FAKE_DESTDIR},@comment @dir ,' >> ${TMPPLIST}

post-install-SOURCES-on:
# Silence stage-qa warnings by sanitizing permissions on sources
	@${FIND} ${FAKE_DESTDIR}${PREFIX}/lib/rustlib/src -type f -exec ${CHMOD} \
		${SHAREMODE} {} +

.include <bsd.port.post.mk>
