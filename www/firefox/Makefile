PORTNAME=     firefox
DISTVERSION=  135.0.1
PORTEPOCH=    2
CATEGORIES=   www wayland
MASTER_SITES= MOZILLA/${PORTNAME}/releases/${DISTVERSION}${DISTVERSIONSUFFIX}/source \
              MOZILLA/${PORTNAME}/candidates/${DISTVERSION}${DISTVERSIONSUFFIX}-candidates/build1/source
DISTFILES=    ${DISTNAME}.source${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
WWW=		https://www.mozilla.com/firefox

LICENSE=	MPL20 gpl2
LICENSE_COMB=	dual

BUILD_DEPENDS=	nspr>=4.32:devel/nspr \
		nss>=3.108:security/nss \
		libevent>=2.1.8:devel/libevent \
		harfbuzz>=10.1.0:print/harfbuzz \
		graphite2>=1.3.14:graphics/graphite2 \
		png>=1.6.45:graphics/png \
		dav1d>=1.0.0:multimedia/dav1d \
		libvpx>=1.15.0:multimedia/libvpx \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR} \
		v4l_compat>0:multimedia/v4l_compat \
		autoconf2.13:devel/autoconf2.13 \
		nasm:devel/nasm \
		yasm:devel/yasm \
		zip:archivers/zip \
		python3:lang/python3 \
		clang15:devel/llvm15 \
		cargo:lang/rust \
		cbindgen:devel/rust-cbindgen

LIB_DEPENDS+=   libvpx.so:multimedia/libvpx \
                libevent.so:devel/libevent \
                libstartup-notification-1.so:x11/startup-notification \
                libnspr4.so:devel/nspr \
                libnss3.so:security/nss \
                libicui18n.so:devel/icu \
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
                libdav1d.so:multimedia/dav1d

USES=           compiler:c++17-lang cpe gl gettext gmake gnome iconv jpeg localbase perl5 pkgconfig \
                python desktop-file-utils tar:xz
CPE_VENDOR=     mozilla
USE_GL=         gl
USE_GNOME=      cairo gdkpixbuf gtk30
USE_XORG=       x11 xcb xcomposite xdamage xext xfixes xrender xt ice sm

QMAKE_ARGS=		--enable-application=browser \
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
			--disable-debug \
			--disable-debug-symbols \
			--disable-dtrace \
			--disable-jack \
			--disable-profiling \
			--disable-pulseaudio \
			--disable-tests \
			--disable-updater \
			--disable-webrtc \
			--disable-hardening \
			--prefix=${PREFIX} \
			--with-intl-api \
			--with-system-icu \
			--with-system-libevent \
			--with-system-nspr \
			--with-system-nss \
			--with-system-png \
			--with-system-zlib \
			--without-wasm-sandboxed-libraries

# --with-system-jpeg

LLVM_VERSION=	15
MBSD64_TARGET=	x86_64-mports-freebsd12.3
CONFIGURE_TARGET=	${MBSD64_TARGET}
HAS_CONFIGURE=	yes
CONFIGURE_ENV+= BINDGEN_CFLAGS="-I${LOCALBASE}/include"
CONFIGURE_OUTSOURCE=    yes
LDFLAGS+=               -Wl,--as-needed -Wl,--undefined-version -L/usr/local/lib
#BINARY_ALIAS+=  python3=${PYTHON_CMD}

MOZ_OPTIONS+=   --with-libclang-path="${LLVM_PREFIX:S/${PREFIX}/${LOCALBASE}/}/lib"
.    if !exists(/usr/bin/llvm-objdump)
MOZ_EXPORT+=    LLVM_OBJDUMP="${LOCALBASE}/bin/llvm-objdump${LLVM_VERSION}"
.    endif
# Require newer Clang than what's in base system unless user opted out
.    if ${CC} == cc && ${CXX} == c++ && exists(/usr/lib/libc++.so)
CPP=                    ${LOCALBASE}/bin/clang-cpp${LLVM_VERSION}
CC=                             ${LOCALBASE}/bin/clang${LLVM_VERSION}
CXX=                    ${LOCALBASE}/bin/clang++${LLVM_VERSION}
USES:=                  ${USES:Ncompiler\:*} # XXX avoid warnings
.    endif


post-extract:
	${SED} -e 's|@FIREFOX_ICON@|firefox|;s|@MOZILLA@|firefox|' \
		< ${FILESDIR}/firefox.desktop.in \
		> ${WRKDIR}/firefox.desktop

post-patch:
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/browser/app/nsBrowserApp.cpp
	(cd ${WRKSRC}/gfx/angle/checkout/src/compiler/translator && \
		${REINPLACE_CMD} -e 's|<math.h>|<cmath>|' \
		InfoSink.h IntermNode.cpp)
	# disable SCTP
	${REINPLACE_CMD} -e 's|MOZ_SCTP|MOZ_DISABLE_SCTP|' \
		${WRKSRC}/netwerk/moz.build
	# disable rust checksums
	${REINPLACE_CMD} -e 's/"files":{[^}]*}/"files":{}/' \
		${WRKSRC}/third_party/rust/libc/.cargo-checksum.json \
		${WRKSRC}/third_party/rust/quinn-udp/.cargo-checksum.json
	# Fix midnight
	${REINPLACE_CMD} -e "s|%%MBSD64_TGT%%|${MBSD64_TARGET}|" \
		${WRKSRC}/build/autoconf/config.guess
	# Set mozilla options
	@${ECHO_CMD} "--=> Setting configuration <=--"
	@for arg in ${QMAKE_ARGS}; do \
		${ECHO_CMD} ".mozconfig <<  $$arg" ;\
		${ECHO_CMD} ac_add_options $$arg >> ${WRKSRC}/.mozconfig ;\
	done
	@${ECHO_CMD} LDFLAGS=\"-lm ${MOZLDFLAGS} -Wl,-rpath,${PREFIX}/lib/firefox\" \
		>> ${WRKSRC}/.mozconfig

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/pixmaps \
		${STAGEDIR}${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKDIR}/firefox.desktop \
		${STAGEDIR}${PREFIX}/share/applications/
	(cd ${STAGEDIR}${PREFIX}/share/pixmaps &&\
	${LN} -sf ../../lib/firefox/browser/chrome/icons/default/default48.png firefox.png)
	# Rewrite symlink to make it relative instead of absolute
	(cd ${STAGEDIR}${PREFIX}/bin &&\
	${LN} -sf ../lib/firefox/firefox firefox)

.include <bsd.port.mk>
