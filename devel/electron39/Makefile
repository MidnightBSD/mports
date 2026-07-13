PORTNAME=	electron
DISTVERSIONPREFIX=	v
DISTVERSION=	${ELECTRON_VER}
PORTREVISION=	1
PULSEMV=	16
PULSEV=		${PULSEMV}.1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/tagattie/FreeBSD-Electron/releases/download/v39.3.0/:chromium \
		https://freedesktop.org/software/pulseaudio/releases/:pulseaudio
PKGNAMESUFFIX=	${ELECTRON_VER_MAJOR}
DISTFILES=	chromium-${CHROMIUM_VER}${EXTRACT_SUFX}.0:chromium \
		chromium-${CHROMIUM_VER}${EXTRACT_SUFX}.1:chromium \
		chromium-${CHROMIUM_VER}${EXTRACT_SUFX}.2:chromium \
		pulseaudio-${PULSEV}.tar.gz:pulseaudio
DIST_SUBDIR=	${PORTNAME}
EXTRACT_ONLY=	${DISTFILES:C/:[^:]+$//:C/chromium-${CHROMIUM_VER}${EXTRACT_SUFX}\.[0-9]//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build cross-platform desktop apps with JavaScript, HTML, and CSS
WWW=		https://electronjs.org/

LICENSE=	bsd3 lgpl2.1 mit MPL11
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/electron/LICENSE

ONLY_FOR_ARCHS=	aarch64 amd64

FETCH_DEPENDS=	git:devel/git \
		${NULL}
PATCH_DEPENDS=	git:devel/git \
		jq:textproc/jq
BUILD_DEPENDS=	gperf:devel/gperf \
		bindgen:devel/rust-bindgen-cli \
		yasm:devel/yasm \
		${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri \
		rustc:lang/rust \
		${LOCALBASE}/include/linux/videodev2.h:multimedia/v4l_compat \
		${NULL}
LIB_DEPENDS=	libatk-bridge-2.0.so:accessibility/at-spi2-core \
		libatspi.so:accessibility/at-spi2-core \
		libFLAC.so:audio/flac \
		libopus.so:audio/opus \
		libdbus-1.so:devel/dbus \
		libepoll-shim.so:devel/libepoll-shim \
		libevent.so:devel/libevent \
		libffi.so:devel/libffi \
		libnotify.so:devel/libnotify \
		libpci.so:devel/libpci \
		libnspr4.so:devel/nspr \
		libre2.so:devel/re2 \
		libdrm.so:graphics/libdrm \
		libpng.so:graphics/png \
		libwayland-client.so:graphics/wayland \
		libwebp.so:graphics/webp \
		libdav1d.so:multimedia/dav1d \
		libva.so:multimedia/libva \
		libopenh264.so:multimedia/openh264 \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz \
		libsecret-1.so:security/libsecret \
		libnss3.so:security/nss \
		libexpat.so:textproc/expat2 \
		libxkbcommon.so:x11/libxkbcommon \
		libxshmfence.so:x11/libxshmfence \
		libfontconfig.so:x11-fonts/fontconfig
RUN_DEPENDS=	xdg-open:devel/xdg-utils
TEST_DEPENDS=	git:devel/git \
		${PYTHON_PKGNAMEPREFIX}python-dbusmock>0:devel/py-python-dbusmock@${PY_FLAVOR}

USES=		bison compiler:c++17-lang cpe display:test \
		gettext-tools gl gmake gnome iconv:wchar_t jpeg \
		localbase:ldflags ninja nodejs:build pkgconfig \
		python:build,test qt:5 shebangfix tar:xz xorg

CPE_VENDOR=	electronjs
USE_GITHUB=	yes
GH_TUPLE=	nodejs:node:v${NODE_VER}:node \
		nodejs:nan:${NAN_VER}:nan \
		Squirrel:Squirrel.Mac:${SQUIRREL_MAC_VER}:squirrel_mac \
		ReactiveCocoa:ReactiveObjC:${REACTIVEOBJC_VER}:reactiveobjc \
		Mantle:Mantle:${MANTLE_VER}:mantle \
		EngFlow:reclient-configs:${ENGFLOW_RECLIENT_CONFIGS_VER}:reclient_configs
USE_GL=		gbm gl glesv2
USE_GNOME=	atk cairo gdkpixbuf gtk30 libxml2 libxslt pango
USE_XORG=	x11 xcb xcomposite xcursor xdamage xext xfixes xi xrandr \
		xrender xscrnsaver xtst
USE_QT=		buildtools:build core:build widgets:build
NPM_EXTRACT_WRKSRC=	${WRKDIR}/${PKGNAME}/${PORTNAME}-${ELECTRON_VER}

# Ported from FreeBSD's USES=electron:env + USE_ELECTRON=npm:yarn4,prefetch,extract
NPM_CMDNAME=	yarn
NPM_VER=	4.12.0
PKGJSONSDIR=	${FILESDIR}/packagejsons
NPM_PKGFILE=	package.json
NPM_LOCKFILE=	yarn.lock
NPM_MODULE_CACHE=	yarn-offline-cache
NPM_CACHE_SETUP_CMD=	${SH} -c "${NPM_CMDNAME} config set enableGlobalCache false; \
			${NPM_CMDNAME} config set cacheFolder \"./${NPM_MODULE_CACHE}\""
NPM_FETCH_CMD=		${NPM_CMDNAME} install
NPM_FETCH_FLAGS=	--immutable --mode=skip-build --silent
NPM_EXTRACT_SETUP_CMD=	${SH} -c "${NPM_CMDNAME} config set enableNetwork false; \
			${NPM_CMDNAME} config set enableInlineBuilds true"
NPM_EXTRACT_CMD=	${NPM_FETCH_CMD}
NPM_EXTRACT_FLAGS=	${NPM_FETCH_FLAGS} --immutable-cache

_DISTFILE_NODE_MODULES=	${PORTNAME}${ELECTRON_VER_MAJOR}-${ELECTRON_VER}-node-modules${EXTRACT_SUFX}
DISTFILES+=		${NPM_CMDNAME}-${NPM_VER}.tgz \
			${_DISTFILE_NODE_MODULES}

# `corepack` places shims in PATH; keep those private to the port.
NPM_BINDIR=		${WRKDIR}/.bin
YARN_COREPACK_HOME=	${WRKDIR}/.corepack-home

YARN_TGZ=	${DISTDIR}/${DIST_SUBDIR}/${NPM_CMDNAME}-${NPM_VER}.tgz
NODE_MODULES_TARBALL=	${DISTDIR}/${DIST_SUBDIR}/${_DISTFILE_NODE_MODULES}

YARN_NPM_URL=	https://registry.npmjs.org/@yarnpkg/cli-dist/-/cli-dist-${NPM_VER}.tgz

pre-fetch: electron-fetch-node-package-manager electron-fetch-node-modules electron-archive-node-modules

electron-fetch-node-package-manager:
	@if [ -f ${YARN_TGZ} ]; then \
		${ECHO_MSG} "===>  Using prefetched ${NPM_CMDNAME} ${NPM_VER}"; \
	else \
		${ECHO_MSG} "===>  Fetching ${NPM_CMDNAME} ${NPM_VER}"; \
		${MKDIR} ${DISTDIR}/${DIST_SUBDIR}; \
		${FETCH_CMD} -o ${YARN_TGZ} ${YARN_NPM_URL}; \
	fi
	${MKDIR} ${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}
	yarn_path=package/bin/yarn.js; \
	if ! ${TAR} -tzf ${YARN_TGZ} $${yarn_path} >/dev/null 2>&1; then \
		yarn_path=yarn/${NPM_VER}/yarn.js; \
	fi; \
	${TAR} -xzOf ${YARN_TGZ} $${yarn_path} > \
		${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}/yarn.js
	${CHMOD} 755 ${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}/yarn.js
	hash=$$(sha512 -q ${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}/yarn.js); \
	printf '{"locator":{"name":"yarn","reference":"${NPM_VER}"},"bin":["yarn","yarnpkg"],"hash":"sha512.%s"}\n' "$${hash}" > \
		${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}/.corepack; \
	printf '{"yarn":"%s+sha512.%s"}\n' "${NPM_VER}" "$${hash}" > \
		${YARN_COREPACK_HOME}/lastKnownGood.json

electron-fetch-node-modules:
	@set -e; \
	if [ -f ${NODE_MODULES_TARBALL} ]; then \
		${ECHO_MSG} "===>  Using prefetched node modules tarball"; \
		exit 0; \
	fi; \
	${ECHO_MSG} "===>  Prefetching node modules (offline cache)"; \
	${RM} -rf ${WRKDIR}/.npm-prefetch; \
	${MKDIR} ${WRKDIR}/.npm-prefetch ${WRKDIR}/${PKGNAME}; \
	cd ${WRKDIR}/.npm-prefetch && ${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}.tar.gz; \
	pkgdir=`cd ${WRKDIR}/.npm-prefetch && ${FIND} . -maxdepth 1 -type d -name '${PORTNAME}-*' -print | ${HEAD} -n 1 | ${SED} -e 's|^\\./||'`; \
	${TEST} -n "$${pkgdir}"; \
	${MV} ${WRKDIR}/.npm-prefetch/$${pkgdir} ${NPM_EXTRACT_WRKSRC}; \
	${MKDIR} ${NPM_BINDIR}; \
	${SETENV} ${MAKE_ENV} corepack enable --install-directory ${NPM_BINDIR}; \
	${ECHO_MSG} "===>  Copying ${NPM_PKGFILE} and ${NPM_LOCKFILE} to ${NPM_EXTRACT_WRKSRC}"; \
	for f in `${FIND} ${PKGJSONSDIR} -type f \\( -name ${NPM_PKGFILE} -o -name ${NPM_LOCKFILE} \\) -print | ${SED} -e 's|${PKGJSONSDIR}/||'`; do \
		${MKDIR} -p `${DIRNAME} ${NPM_EXTRACT_WRKSRC}/$${f}`; \
		${CP} ${PKGJSONSDIR}/$${f} ${NPM_EXTRACT_WRKSRC}/$${f}; \
	done; \
	${ECHO_MSG} "===>  Installing node modules into offline cache"; \
	cd ${NPM_EXTRACT_WRKSRC} && ${SETENV} ${MAKE_ENV} PATH=${NPM_BINDIR}:$$PATH ${NPM_CACHE_SETUP_CMD}; \
	cd ${NPM_EXTRACT_WRKSRC} && ${SETENV} ${MAKE_ENV} PATH=${NPM_BINDIR}:$$PATH ${NPM_FETCH_CMD} ${NPM_FETCH_FLAGS}

electron-archive-node-modules:
	@set -e; \
	if [ -f ${NODE_MODULES_TARBALL} ]; then \
		exit 0; \
	fi; \
	${ECHO_MSG} "===>  Archiving node modules offline cache"; \
	cd ${NPM_EXTRACT_WRKSRC} && ${TAR} -cJf ${NODE_MODULES_TARBALL} ${NPM_MODULE_CACHE}

SHEBANG_FILES=	chrome/tools/build/linux/chrome-wrapper buildtools/linux64/clang-format

MAKE_ARGS=	-C out/${BUILDTYPE}
MAKE_ENV+=	C_INCLUDE_PATH=${LOCALBASE}/include \
		CPLUS_INCLUDE_PATH=${LOCALBASE}/include
ALL_TARGET=	electron electron:node_headers
POST_BUILD_TARGETS=	licenses version
POST_BUILD_DIST_TARGETS=electron_dist_zip electron_chromedriver_zip \
			electron_mksnapshot_zip

DATADIR=	${PREFIX}/share/${PORTNAME}${PKGNAMESUFFIX}
BINARY_ALIAS=	python3=${PYTHON_CMD}
BUNDLE_LIBS=	yes

NO_WRKSUBDIR=	yes
WRKSRC=		${WRKDIR}/${PKGNAME}
WRKSRC_SUBDIR=	src

GN_ARGS+=	clang_use_chrome_plugins=false \
		enable_backup_ref_ptr_support=false \
		enable_hangout_services_extension=true \
		enable_remoting=false \
		fatal_linker_warnings=false \
		icu_use_data_file=false \
		is_clang=true \
		is_electron_build=true \
		is_mas_build=false \
		moc_qt5_path="${QT_TOOLDIR}/moc" \
		node_path="//third_party/electron_node" \
		node_v8_path="//v8" \
		optimize_webui=true \
		toolkit_views=true \
		treat_warnings_as_errors=false \
		use_allocator_shim=false \
		use_aura=true \
		use_custom_libcxx=true \
		use_custom_libunwind=true \
		use_lld=true \
		use_partition_alloc=true \
		use_partition_alloc_as_malloc=false \
		use_qt5=true \
		use_sysroot=false \
		use_system_freetype=false \
		use_system_harfbuzz=true \
		use_system_libffi=true \
		use_system_libjpeg=true \
		use_udev=false \
		rtc_video_psnr=false \
		chrome_pgo_phase=0 \
		extra_cflags="${CFLAGS}" \
		extra_cxxflags="${CXXFLAGS} -I${LOCALBASE}/include/libepoll-shim ${PINCLUDES}" \
		extra_ldflags="${LDFLAGS}" \
		ffmpeg_branding="${FFMPEG_BRAND}" \
		override_electron_version="${ELECTRON_VER}"

# TODO: investigate building with these options:
# use_system_minigbm
GN_BOOTSTRAP_FLAGS=	--no-clean --no-rebuild --skip-generate-buildfiles

PLIST_SUB=	ELECTRON_VER=${ELECTRON_VER} \
		ELECTRON_VER_MAJOR=${ELECTRON_VER_MAJOR}

OPTIONS_DEFINE=		CODECS CUPS DEBUG DIST DRIVER KERBEROS LTO PIPEWIRE
OPTIONS_DEFAULT=	CODECS CUPS KERBEROS PIPEWIRE ALSA PULSEAUDIO SNDIO
OPTIONS_EXCLUDE_aarch64=LTO
OPTIONS_GROUP=		AUDIO
OPTIONS_GROUP_AUDIO=	ALSA PULSEAUDIO SNDIO
OPTIONS_RADIO=		KERBEROS
OPTIONS_RADIO_KERBEROS=	HEIMDAL HEIMDAL_BASE MIT
OPTIONS_SUB=		yes
CODECS_DESC=		Compile and enable patented codecs like H.264
DIST_DESC=		Build distribution zip files
DRIVER_DESC=		Install chromedriver
HEIMDAL_BASE_DESC=	Heimdal Kerberos (base)
HEIMDAL_DESC=		Heimdal Kerberos (security/heimdal)
MIT_DESC=		MIT Kerberos (security/krb5)
PIPEWIRE_DESC=		Screen capture via PipeWire

ALSA_LIB_DEPENDS=	libasound.so:audio/alsa-lib
ALSA_RUN_DEPENDS=	${LOCALBASE}/lib/alsa-lib/libasound_module_pcm_oss.so:audio/alsa-plugins \
			alsa-lib>=1.1.1_1:audio/alsa-lib
ALSA_VARS=		GN_ARGS+=use_alsa=true
ALSA_VARS_OFF=		GN_ARGS+=use_alsa=false

CODECS_VARS=		GN_ARGS+=proprietary_codecs=true \
			FFMPEG_BRAND="Chrome"
CODECS_VARS_OFF=	GN_ARGS+=proprietary_codecs=false \
			FFMPEG_BRAND="Chromium"

CUPS_LIB_DEPENDS=	libcups.so:print/cups
CUPS_VARS=		GN_ARGS+=use_cups=true
CUPS_VARS_OFF=		GN_ARGS+=use_cups=false

DEBUG_BUILD_DEPENDS=	esbuild:devel/esbuild
DEBUG_MAKE_ENV=		ELECTRON_OUT_DIR=Debug
DEBUG_MAKE_ENV_OFF=	ELECTRON_OUT_DIR=Release
DEBUG_VARS=		BUILDTYPE=Debug \
			GN_FILE=testing.gn \
			GN_ARGS+=is_debug=true \
			GN_ARGS+=is_component_build=false \
			GN_ARGS+=symbol_level=1 \
			GN_BOOTSTRAP_FLAGS+=--debug \
			WANTSPACE="21 GB"
DEBUG_VARS_OFF=		BUILDTYPE=Release \
			GN_FILE=release.gn \
			GN_ARGS+=blink_symbol_level=0 \
			GN_ARGS+=is_debug=false \
			GN_ARGS+=is_official_build=true \
			GN_ARGS+=symbol_level=0 \
			WANTSPACE="14 GB"

DRIVER_MAKE_ARGS=	chromedriver

HEIMDAL_LIB_DEPENDS=	libkrb5.so.26:security/heimdal
KERBEROS_VARS=		GN_ARGS+=use_kerberos=true
KERBEROS_VARS_OFF=	GN_ARGS+=use_kerberos=false

LTO_VARS=		GN_ARGS+=use_thin_lto=true \
			GN_ARGS+=thin_lto_enable_optimizations=true \
			WANTSPACE="14 GB"
LTO_VARS_OFF=		GN_ARGS+=use_thin_lto=false

MIT_LIB_DEPENDS=	libkrb5.so.3:security/krb5

PIPEWIRE_LIB_DEPENDS=	libpipewire-0.3.so:multimedia/pipewire
PIPEWIRE_VARS=		GN_ARGS+=rtc_use_pipewire=true \
			GN_ARGS+=rtc_link_pipewire=true
PIPEWIRE_VARS_OFF=	GN_ARGS+=rtc_use_pipewire=false \
			GN_ARGS+=rtc_link_pipewire=false

PULSEAUDIO_VARS=	GN_ARGS+=use_pulseaudio=true \
			PINCLUDES="-I${WRKSRC:H}/pulseaudio-${PULSEV}/src -DPA_MAJOR=${PULSEMV}"
PULSEAUDIO_VARS_OFF=	GN_ARGS+=use_pulseaudio=false

SNDIO_LIB_DEPENDS=	libsndio.so:audio/sndio
SNDIO_VARS=		GN_ARGS+=use_sndio=true
SNDIO_VARS_OFF=		GN_ARGS+=use_sndio=false

# See ${WRKSRC}/electron/DEPS for CHROMIUM_VER
CHROMIUM_VER=			142.0.7444.265
# See ${WRKSRC}/electron/DEPS for NODE_VER
NODE_VER=			22.22.1
# See ${WRKSRC}/electron/DEPS for NAN_VER
NAN_VER=			e14bdcd1f72d62bca1d541b66da43130384ec213
# See ${WRKSRC}/electron/DEPS for SQUIRREL_MAC_VER
SQUIRREL_MAC_VER=		0e5d146ba13101a1302d59ea6e6e0b3cace4ae38
# See ${WRKSRC}/electron/DEPS for REACTIVEOBJC_VER
REACTIVEOBJC_VER=		74ab5baccc6f7202c8ac69a8d1e152c29dc1ea76
# See ${WRKSRC}/electron/DEPS for MANTLE_VER
MANTLE_VER=			78d3966b3c331292ea29ec38661b25df0a245948
# See ${WRKSRC}/electron/DEPS for ENGFLOW_RECLIENT_CONFIGS_VER
ENGFLOW_RECLIENT_CONFIGS_VER=	955335c30a752e9ef7bff375baab5e0819b6c00d

.include "Makefile.version"
.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MHEIMDAL_BASE} && !exists(/usr/lib/libkrb5.so)
IGNORE=		you have selected HEIMDAL_BASE but do not have Heimdal installed in base
.endif

LLVM_DEFAULT=		19
BUILD_DEPENDS+=		clang${LLVM_DEFAULT}:devel/llvm${LLVM_DEFAULT}
BINARY_ALIAS+=		ar=${LOCALBASE}/llvm${LLVM_DEFAULT}/bin/llvm-ar \
			nm=${LOCALBASE}/llvm${LLVM_DEFAULT}/bin/llvm-nm \
			ld=${LOCALBASE}/llvm${LLVM_DEFAULT}/bin/ld.lld

# GN's default toolchain uses `cc`/`c++` from PATH. Do not use BINARY_ALIAS
# symlinks for those: clang's resource-dir resolution uses argv[0] and breaks
# when invoked via a symlink in `${WRKDIR}/.bin`, causing missing intrinsics
# headers like `xmmintrin.h`.
CC=			${LOCALBASE}/llvm${LLVM_DEFAULT}/bin/clang
CXX=			${LOCALBASE}/llvm${LLVM_DEFAULT}/bin/clang++
CPP=			${LOCALBASE}/llvm${LLVM_DEFAULT}/bin/clang-cpp
CFLAGS+=		-Wno-error=implicit-function-declaration

.if ${ARCH} == "aarch64"
PLIST_SUB+=	AARCH64="" \
		AMD64="@comment " \
		I386="@comment " \
		NOT_AARCH64="@comment "
FFMPEG_TARGET=	arm64
.elif ${ARCH} == "amd64"
BUILD_DEPENDS+=	nasm:devel/nasm
PLIST_SUB+=	AARCH64="@comment " \
		AMD64="" \
		I386="@comment " \
		NOT_AARCH64=""
FFMPEG_TARGET=	x64
.elif ${ARCH} == "i386"
BUILD_DEPENDS+=	nasm:devel/nasm
PLIST_SUB+=	AARCH64="@comment " \
		AMD64="@comment " \
		I386="" \
		NOT_AARCH64=""
FFMPEG_TARGET=	ia32
.endif

FFMPEG_BDIR=	${WRKSRC}/third_party/ffmpeg/build.${FFMPEG_TARGET}.freebsd/${FFMPEG_BRAND}
FFMPEG_CDIR=	${WRKSRC}/third_party/ffmpeg/chromium/config/${FFMPEG_BRAND}/freebsd/${FFMPEG_TARGET}

# Allow relocations against read-only segments (override lld default)
LDFLAGS_i386=	-Wl,-znotext

# TODO: -isystem, would be just as ugly as this approach, but more reliably
# build would fail without C_INCLUDE_PATH/CPLUS_INCLUDE_PATH env var set.
MAKE_ENV+=	C_INCLUDE_PATH=${LOCALBASE}/include \
		CPLUS_INCLUDE_PATH=${LOCALBASE}/include

# corepack: use pre-seeded home, no network
MAKE_ENV+=	COREPACK_HOME=${YARN_COREPACK_HOME} \
		COREPACK_ENABLE_NETWORK=0

# rust
MAKE_ENV+=	RUSTC_BOOTSTRAP=1
GN_ARGS+=	enable_rust=true \
		rust_sysroot_absolute="${LOCALBASE}"

TEST_ENV+=	${MAKE_ENV} \
		ELECTRON_OUT_DIR=${BUILDTYPE} \
		LOCAL_GIT_DIRECTORY=${LOCALBASE} \
		DISABLE_CRASH_REPORTER_TESTS=1

pre-everything::
	@${ECHO_MSG}
	@${ECHO_MSG} "To build electron, you should have around 2GB of memory"
	@${ECHO_MSG} "and around ${WANTSPACE} of free disk space."
	@${ECHO_MSG}

pre-extract:
# Chromium source tarball is splitted into multiple fragments. Concatenate them
# into a single one and manually extract it into WRKDIR.
	@${CAT} ${DISTDIR}/${DIST_SUBDIR}/chromium-${CHROMIUM_VER}${EXTRACT_SUFX}.? > \
		${WRKSRC:H}/chromium-${CHROMIUM_VER}${EXTRACT_SUFX}
	@cd ${WRKSRC:H} && \
	${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} \
		chromium-${CHROMIUM_VER}${EXTRACT_SUFX} ${EXTRACT_AFTER_ARGS}

post-extract:
# Move extracted sources to appropriate locations
	${MV} ${WRKSRC:H}/chromium-${CHROMIUM_VER} ${WRKSRC}
	${MV} ${WRKSRC:H}/${PORTNAME}-${ELECTRON_VER} ${WRKSRC}/electron
	${MV} ${WRKSRC:H}/${GH_PROJECT_nan}-${NAN_VER} ${WRKSRC}/third_party/nan
	${MV} ${WRKSRC:H}/${GH_PROJECT_node}-${NODE_VER} \
		${WRKSRC}/third_party/electron_node
	${MV} ${WRKSRC:H}/${GH_PROJECT_squirrel_mac}-${SQUIRREL_MAC_VER} \
		${WRKSRC}/third_party/squirrel.mac
	@${MKDIR} ${WRKSRC}/third_party/squirrel.mac/vendor
	${MV} ${WRKSRC:H}/${GH_PROJECT_reactiveobjc}-${REACTIVEOBJC_VER} \
		${WRKSRC}/third_party/squirrel.mac/vendor/ReactiveObjC
	${MV} ${WRKSRC:H}/${GH_PROJECT_mantle}-${MANTLE_VER} \
		${WRKSRC}/third_party/squirrel.mac/vendor/Mantle
	${MV} ${WRKSRC:H}/${GH_PROJECT_reclient_configs}-${ENGFLOW_RECLIENT_CONFIGS_VER} \
		${WRKSRC}/third_party/engflow-reclient-configs
	@${MKDIR} ${WRKSRC}/third_party/test_fonts/test_fonts
	@if [ ! -f ${WRKSRC}/third_party/test_fonts/test_fonts/Ahem.ttf ]; then \
		${CP} ${WRKSRC}/third_party/blink/renderer/core/testing/data/Ahem.ttf \
			${WRKSRC}/third_party/test_fonts/test_fonts/Ahem.ttf; \
	fi

pre-patch:
	${REINPLACE_CMD} -e 's|src/third_party/angle/src|src/third_party/angle|' \
		${WRKSRC}/electron/patches/config.json
	${SH} ${FILESDIR}/apply-electron-patches.sh ${WRKSRC}
	# ${FIND} ${WRKSRC} -type f -name '*.orig' -print -delete
	# ${FIND} ${WRKSRC} -type f -name '*~' -print -delete

pre-configure:
	# Install Electron's node_modules using the prefetched Yarn cache.
	# (The node-modules distfile is an offline Yarn cache, not a full node_modules tree.)
	@${MKDIR} ${NPM_BINDIR} ${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}
	${SETENV} ${MAKE_ENV} corepack enable --install-directory ${NPM_BINDIR}
	yarn_path=package/bin/yarn.js; \
	if ! ${TAR} -tzf ${YARN_TGZ} $${yarn_path} >/dev/null 2>&1; then \
		yarn_path=yarn/${NPM_VER}/yarn.js; \
	fi; \
	${TAR} -xzOf ${YARN_TGZ} $${yarn_path} > \
		${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}/yarn.js
	${CHMOD} 755 ${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}/yarn.js
	hash=$$(sha512 -q ${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}/yarn.js); \
	printf '{"locator":{"name":"yarn","reference":"${NPM_VER}"},"bin":["yarn","yarnpkg"],"hash":"sha512.%s"}\n' "$${hash}" > \
		${YARN_COREPACK_HOME}/v1/yarn/${NPM_VER}/.corepack; \
	printf '{"yarn":"%s+sha512.%s"}\n' "${NPM_VER}" "$${hash}" > \
		${YARN_COREPACK_HOME}/lastKnownGood.json
	${RM} -rf ${WRKSRC}/electron/${NPM_MODULE_CACHE}
	cd ${WRKSRC}/electron && ${TAR} -xf ${NODE_MODULES_TARBALL}
	cd ${WRKSRC}/electron && ${SETENV} ${MAKE_ENV} PATH=${NPM_BINDIR}:$$PATH ${NPM_CACHE_SETUP_CMD}
	cd ${WRKSRC}/electron && ${SETENV} ${MAKE_ENV} PATH=${NPM_BINDIR}:$$PATH ${NPM_EXTRACT_SETUP_CMD}
	cd ${WRKSRC}/electron && ${SETENV} ${MAKE_ENV} PATH=${NPM_BINDIR}:$$PATH ${NPM_EXTRACT_CMD} ${NPM_EXTRACT_FLAGS}

	# We used to remove bundled libraries to be sure that chromium uses
	# system libraries and not shipped ones.
	# cd ${WRKSRC} && ${PYTHON_CMD} \
	#./build/linux/unbundle/remove_bundled_libraries.py [list of preserved]
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PYTHON_CMD} \
		./build/linux/unbundle/replace_gn_files.py --system-libraries \
		dav1d flac fontconfig harfbuzz-ng libdrm libpng \
		libusb libwebp libxml libxslt openh264 opus || ${FALSE}
	# Chromium uses an unreleased version of FFmpeg, so configure it
	cd ${WRKSRC}/media/ffmpeg && \
		${PYTHON_CMD} scripts/build_ffmpeg.py freebsd ${FFMPEG_TARGET} \
		--config-only --branding=${FFMPEG_BRAND}
	cd ${FFMPEG_BDIR} && ${GMAKE} ffversion.h
	${MKDIR} ${FFMPEG_CDIR}
.for _e in config.h config.asm config_components.h libavcodec libavformat libavutil
	-${CP} -pR ${FFMPEG_BDIR}/${_e} ${FFMPEG_CDIR}
.endfor
	touch ${WRKSRC:H}/pulseaudio-${PULSEV}/src/pulse/version.h
	@${REINPLACE_CMD} -e 's|$${LOCALBASE}|${LOCALBASE}|;s|$${MODCLANG_VERSION}|${LLVM_DEFAULT}|' \
		${WRKSRC}/build/config/rust.gni \
		${WRKSRC}/build/linux/strip_binary.gni \
		${WRKSRC}/build/rust/rust_bindgen.gni \
		${WRKSRC}/build/rust/rust_bindgen_generator.gni

do-configure:
	@( \
		echo "#ifndef GPU_WEBGPU_DAWN_COMMIT_HASH_H_" ;\
		echo "#define GPU_WEBGPU_DAWN_COMMIT_HASH_H_" ;\
		echo "#define DAWN_COMMIT_HASH \"$$(cat ${WRKSRC}/gpu/webgpu/DAWN_VERSION)\"" ;\
		echo "#endif  // GPU_WEBGPU_DAWN_COMMIT_HASH_H_" \
	) > ${WRKSRC}/gpu/webgpu/dawn_commit_hash.h
	# GN generator bootstrapping and generating ninja files
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} CC=${CC} CXX=${CXX} LD=${CXX} \
		READELF=${READELF} AR=${AR} NM=${NM} ${PYTHON_CMD} \
		./tools/gn/bootstrap/bootstrap.py ${GN_BOOTSTRAP_FLAGS}
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ./out/${BUILDTYPE}/gn gen out/${BUILDTYPE} \
		--args='import("//electron/build/args/${GN_FILE}") ${GN_ARGS}'

	# Make GN available to python scripts called during build
	${LN} -sf ${WRKSRC}/out/${BUILDTYPE}/gn ${WRKDIR}/.bin

	# Setup nodejs dependency
	@${MKDIR} ${WRKSRC}/third_party/node/freebsd/node-freebsd/bin
	${LN} -sf ${LOCALBASE}/bin/node ${WRKSRC}/third_party/node/freebsd/node-freebsd/bin/node

	# Setup buildtools/freebsd
	@${MKDIR} ${WRKSRC}/buildtools/freebsd
	${LN} -sf ${WRKSRC}/buildtools/linux64/clang-format ${WRKSRC}/buildtools/freebsd
	${LN} -sf ${WRKSRC}/out/${BUILDTYPE}/gn ${WRKSRC}/buildtools/freebsd
	${LN} -sf /usr/bin/strip ${WRKSRC}/buildtools/freebsd/strip

post-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
		${MAKE_CMD} ${MAKE_ARGS} ${POST_BUILD_TARGETS}

post-build-DIST-on:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
		${MAKE_CMD} ${MAKE_ARGS} ${POST_BUILD_DIST_TARGETS}
	cd ${WRKSRC}/out/${BUILDTYPE} && \
		${CP} chromedriver.zip chromedriver-v${ELECTRON_VER}-freebsd-${ARCH:S/amd64/x64/:S/i386/ia32/}.zip && \
		${CP} dist.zip electron-v${ELECTRON_VER}-freebsd-${ARCH:S/amd64/x64/:S/i386/ia32/}.zip && \
		${CP} mksnapshot.zip mksnapshot-v${ELECTRON_VER}-freebsd-${ARCH:S/amd64/x64/:S/i386/ia32/}.zip && \
		${SHA256} -r *-v${ELECTRON_VER}-freebsd-*.zip | ${SED} -e 's/ / */' > SHASUMS256.txt

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
.for f in electron mksnapshot v8_context_snapshot_generator
	${INSTALL_PROGRAM} ${WRKSRC}/out/${BUILDTYPE}/${f} ${STAGEDIR}${DATADIR}
.endfor
.for f in libEGL.so libGLESv2.so libffmpeg.so libvk_swiftshader.so
	${INSTALL_LIB} ${WRKSRC}/out/${BUILDTYPE}/${f} ${STAGEDIR}${DATADIR}
.endfor
	${INSTALL_LIB} ${WRKSRC}/out/${BUILDTYPE}/libvulkan.so.1 ${STAGEDIR}${DATADIR}/libvulkan.so
.for f in LICENSE LICENSES.chromium.html snapshot_blob.bin v8_context_snapshot.bin version vk_swiftshader_icd.json
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/${f} ${STAGEDIR}${DATADIR}
.endfor
.for f in chrome_100_percent.pak chrome_200_percent.pak resources.pak
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/${f} ${STAGEDIR}${DATADIR}
.endfor
	${MKDIR} ${STAGEDIR}${DATADIR}/locales
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/locales/*.pak ${STAGEDIR}${DATADIR}/locales
	${MKDIR} ${STAGEDIR}${DATADIR}/resources
.for f in default_app.asar
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/resources/${f} ${STAGEDIR}${DATADIR}/resources
.endfor
	cd ${WRKSRC}/out/${BUILDTYPE}/gen && ${COPYTREE_SHARE} node_headers ${STAGEDIR}${DATADIR}
	cd ${WRKSRC}/out/${BUILDTYPE} && ${COPYTREE_SHARE} gen/electron/buildflags ${STAGEDIR}${DATADIR}
	cd ${WRKSRC}/out/${BUILDTYPE} && ${COPYTREE_SHARE} gen/v8/embedded.S ${STAGEDIR}${DATADIR}
	${RLN} ${STAGEDIR}${DATADIR}/electron ${STAGEDIR}${PREFIX}/bin/electron${PKGNAMESUFFIX}

post-install-DIST-on:
	${MKDIR} ${STAGEDIR}${DATADIR}/releases
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/SHASUMS256.txt ${STAGEDIR}${DATADIR}/releases
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/*-v${ELECTRON_VER}-freebsd-*.zip ${STAGEDIR}${DATADIR}/releases

post-install-DRIVER-on:
	${INSTALL_PROGRAM} ${WRKSRC}/out/${BUILDTYPE}/chromedriver.unstripped \
		${STAGEDIR}${DATADIR}/chromedriver

do-test:
	cd ${WRKSRC}/electron && \
	${SETENV} ${TEST_ENV} npm run test -- --ci

.include <bsd.port.post.mk>
