PORTNAME=	thunderbird
DISTVERSION=	152.0.1
CATEGORIES=	mail news net-im wayland
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/${DISTVERSION}${DISTVERSIONSUFFIX}/source \
		MOZILLA/${PORTNAME}/candidates/${DISTVERSION}${DISTVERSIONSUFFIX}-candidates/build1/source
DISTFILES=	${DISTNAME}.source${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird standalone mail and news client
WWW=		https://www.thunderbird.net/

LICENSE=	MPL20

CONFLICTS_INSTALL=	thunderbird-esr

BUILD_DEPENDS=	nspr>=4.32:devel/nspr \
		nss>=3.124:security/nss \
		libevent>=2.1.8:devel/libevent \
		harfbuzz>=10.1.0:print/harfbuzz \
		graphite2>=1.3.14:graphics/graphite2 \
		png>=1.6.45:graphics/png \
		dav1d>=1.0.0:multimedia/dav1d \
		libvpx>=1.15.0:multimedia/libvpx \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR} \
		v4l_compat>0:multimedia/v4l_compat \
		nasm:devel/nasm \
		yasm:devel/yasm \
		zip:archivers/zip \
		clang19:devel/llvm19 \
		cargo:lang/rust \
		rust-cbindgen>=0.29.1:devel/rust-cbindgen

LIB_DEPENDS+=	libvpx.so:multimedia/libvpx \
		libevent.so:devel/libevent \
		libstartup-notification-1.so:x11/startup-notification \
		libnspr4.so:devel/nspr \
		libnss3.so:security/nss \
		libharfbuzz.so:print/harfbuzz \
		libgraphite2.so.3:graphics/graphite2 \
		libpng16.so:graphics/png \
		libavcodec.so:multimedia/ffmpeg \
		libffi.so:devel/libffi \
		libpixman-1.so:x11/pixman \
		libwebp.so:graphics/webp \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libpci.so:devel/libpci \
		libdbus-1.so:devel/dbus \
		libdbus-glib-1.so:devel/dbus-glib \
		libatk-1.0.so:accessibility/at-spi2-core \
		libaom.so:multimedia/aom \
		libdav1d.so:multimedia/dav1d \
		libproxy.so:net/libproxy \
		libjson-c.so:devel/json-c

USES=		compiler:c++17-lang cpe gl gettext gmake gnome iconv jpeg localbase nodejs:24,build,env \
		perl5 pkgconfig python desktop-file-utils tar:xz
CPE_VENDOR=	mozilla
USE_GL=		gl
USE_GNOME=	cairo gdkpixbuf gtk30
USE_XORG=	x11 xcb xcomposite xdamage xext xfixes xrandr xrender xt ice sm

# cannot use system icu: calendar is completely broken by
# https://unicode-org.atlassian.net/browse/ICU-22132 (fix not in 76.1)
# cannot use system sqlite: Thunderbird bundles its own patched version
QMAKE_ARGS=	--enable-application=comm/mail \
		--enable-chrome-format=omni \
		--enable-default-toolkit=cairo-gtk3 \
		--enable-install-strip \
		--enable-official-branding \
		--enable-optimize \
		--enable-release \
		--enable-strip \
		--enable-libproxy \
		--enable-system-ffi \
		--enable-system-pixman \
		--disable-alsa \
		--disable-crashreporter \
		--disable-debug \
		--disable-debug-symbols \
		--disable-jack \
		--disable-profiling \
		--disable-pulseaudio \
		--disable-tests \
		--disable-updater \
		--disable-webrtc \
		--disable-hardening \
		--prefix=${PREFIX} \
		--with-intl-api \
		--with-system-libevent \
		--with-system-nspr \
		--with-system-nss \
		--with-system-png \
		--with-system-zlib \
		--with-system-jsonc \
		--without-wasm-sandboxed-libraries

LLVM_VERSION=	19
LLVM_PREFIX=	${LOCALBASE}/llvm${LLVM_VERSION}
MBSD_TARGET_ARCH=	${ARCH:S/amd64/x86_64/:S/i386/i686/}
MBSD_TARGET=	${MBSD_TARGET_ARCH}-mports-freebsd13.4
CONFIGURE_TARGET=	${MBSD_TARGET}
HAS_CONFIGURE=	yes
CONFIGURE_ENV+=	BINDGEN_CFLAGS="-I${LOCALBASE}/include" CBINDGEN=${LOCALBASE}/bin/cbindgen
CONFIGURE_OUTSOURCE=	yes
LDFLAGS+=	-Wl,--as-needed -Wl,--undefined-version -L/usr/local/lib
BINARY_ALIAS+=	python3=${PYTHON_CMD}
MAKE_ENV+=	__FreeBSD__=13 __FreeBSD__version=1303501

# helpful when testing beta
WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

MOZ_OPTIONS+=	--with-libclang-path="${LLVM_PREFIX}/lib"
.if !exists(/usr/bin/llvm-objdump)
MOZ_EXPORT+=	LLVM_OBJDUMP="${LOCALBASE}/bin/llvm-objdump${LLVM_VERSION}"
.endif
# Require newer Clang than what's in base system unless user opted out
.if ${CC} == cc && ${CXX} == c++ && exists(/usr/lib/libc++.so)
CPP=		${LOCALBASE}/bin/clang-cpp${LLVM_VERSION}
CC=		${LOCALBASE}/bin/clang${LLVM_VERSION}
CXX=		${LOCALBASE}/bin/clang++${LLVM_VERSION}
USES:=		${USES:Ncompiler\:*} # XXX avoid warnings
.endif

post-extract:
	${SED} -e 's|@PORTNAME_ICON@|thunderbird|;s|@MOZILLA@|thunderbird|' \
		< ${FILESDIR}/thunderbird.desktop.in \
		> ${WRKDIR}/thunderbird.desktop

post-patch:
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/comm/mail/app/nsMailApp.cpp
	# disable rust checksums
	${REINPLACE_CMD} -e 's/"files":{[^}]*}/"files":{}/' \
		${WRKSRC}/third_party/rust/libc/.cargo-checksum.json
	# Fix midnight
	${REINPLACE_CMD} -e "s|%%MBSD64_TGT%%|${MBSD_TARGET}|" \
		${WRKSRC}/build/autoconf/config.guess
	# Set mozilla options
	@${ECHO_CMD} "--=> Setting configuration <=--"
	@for arg in ${QMAKE_ARGS}; do \
		${ECHO_CMD} ".mozconfig <<  $$arg" ;\
		${ECHO_CMD} ac_add_options $$arg >> ${WRKSRC}/.mozconfig ;\
	done
	@${ECHO_CMD} LDFLAGS=\"-lm ${MOZLDFLAGS} -Wl,-rpath,${PREFIX}/lib/thunderbird\" \
		>> ${WRKSRC}/.mozconfig

post-install:
	${MKDIR} ${PREFIX}/share/pixmaps \
		${PREFIX}/share/applications \
		${PREFIX}/lib/thunderbird/defaults
	${INSTALL_DATA} ${WRKDIR}/thunderbird.desktop \
		${PREFIX}/share/applications/
	(cd ${PREFIX}/share/pixmaps &&\
	${LN} -sf ../../lib/thunderbird/chrome/icons/default/default48.png thunderbird.png)
	# Rewrite symlink to make it relative instead of absolute
	(cd ${PREFIX}/bin &&\
	${LN} -sf ../lib/thunderbird/thunderbird thunderbird)

.include <bsd.port.mk>
