PORTNAME=	firefox
DISTVERSION=	128.12.0
PORTEPOCH=	1
CATEGORIES=	www wayland
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/${DISTVERSION}esr/source \
		MOZILLA/${PORTNAME}/candidates/${DISTVERSION}esr-candidates/build1/source
PKGNAMESUFFIX=	-esr
DISTFILES=	${DISTNAME}esr.source${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
WWW=		https://www.mozilla.com/firefox

LICENSE=	MPL20 gpl2
LICENSE_COMB=	dual

BUILD_DEPENDS=	nspr>=4.32:devel/nspr \
		nss>=3.101:security/nss \
		icu>=73.1,1:devel/icu \
		libevent>=2.1.8:devel/libevent \
		harfbuzz>=8.5.0:print/harfbuzz \
		graphite2>=1.3.14:graphics/graphite2 \
		png>=1.6.43:graphics/png \
		dav1d>=1.0.0:multimedia/dav1d \
		libvpx>=1.14.0:multimedia/libvpx \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR} \
		v4l_compat>0:multimedia/v4l_compat \
		autoconf2.13:devel/autoconf2.13 \
		nasm:devel/nasm \
		yasm:devel/yasm \
		zip:archivers/zip
 
#	${LOCALBASE}/share/wasi-sysroot/lib/wasm32-wasi/libc++abi.a:devel/wasi-libcxx${LLVM_VERSION} \
#${LOCALBASE}/share/wasi-sysroot/lib/wasm32-wasi/libc.a:devel/wasi-libc@${LLVM_VERSION} \
#		wasi-compiler-rt${LLVM_VERSION}>0:devel/wasi-compiler-rt${LLVM_VERSION}

USE_GECKO=	gecko
CPE_PRODUCT=	${PORTNAME}_esr
CONFLICTS_INSTALL=	firefox
USE_MOZILLA=	-sqlite
CONFIGURE_ENV+=	BINDGEN_CFLAGS="-I${LOCALBASE}/include"
MBSD64_TARGET=  x86_64-mports-freebsd12.3
CONFIGURE_TARGET=       ${MBSD64_TARGET}

USES+=		perl5 tar:xz

MOZILLA=        browser                                                                                                                                                   
MOZILLA_NAME=   Browser                                                                                                                                                   
#MOZ_OPTIONS=    --program-transform-name='s/firefox/${MOZILLA}/'                                                                                                          
FIREFOX_ICON=		${MOZILLA}.png
FIREFOX_ICON_SRC=	${PREFIX}/lib/${MOZILLA}/browser/chrome/icons/default/default48.png
FIREFOX_DESKTOP=	${MOZSRC}/taskcluster/docker/${MOZILLA}-snap/${MOZILLA}.desktop
MOZ_OPTIONS=	--enable-application=browser \
		--enable-install-strip \
		--enable-optimize \
		--enable-strip \
		--enable-libproxy \
		--disable-official-branding \
		--disable-webrtc \
		--disable-tests \
		--disable-updater \
		--disable-hardening \
		--without-wasm-sandboxed-libraries \
		--disable-debug \
		--disable-debug-symbols \
		--disable-profiling \
		--disable-dtrace \
		--disable-crashreporter \
		--disable-alsa \
                --disable-jack \
                --disable-pulseaudio \
		--with-intl-api \
                --with-system-icu \
                --with-system-jpeg \
                --with-system-libevent \
                --with-system-nspr \
                --with-system-nss \
                --with-system-png \
                --with-system-zlib \
                --without-wasm-sandboxed-libraries

MAKE_ENV+=    __FreeBSD__=13 __FreeBSD__version=1303501

.include "Makefile.options"

#BUILD_DEPENDS+= ${LOCALBASE}/share/wasi-sysroot/lib/wasm32-wasi/libc++abi.a:devel/wasi-libcxx \
#		${LOCALBASE}/share/wasi-sysroot/lib/wasm32-wasi/libc.a:devel/wasi-libc \
#		${LOCALBASE}/llvm${LLVM_DEFAULT}/lib/clang/${LLVM_VERSION}/lib/wasi/libclang_rt.builtins-wasm32.a:devel/wasi-compiler-rt${LLVM_DEFAULT}
#MOZ_OPTIONS+=	--with-wasi-sysroot=${LOCALBASE}/share/wasi-sysroot

post-patch:
	-${REINPLACE_CMD} -e 's/%u/%U/' -e '/X-MultipleArgs/d' \
		-e '/^Icon/s/=.*/=${FIREFOX_ICON:R}/' \
		${FIREFOX_DESKTOP}
	-${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/browser/app/nsBrowserApp.cpp
	# disable SCTP
	${REINPLACE_CMD} -e 's|MOZ_SCTP|MOZ_DISABLE_SCTP|' \
		${WRKSRC}/netwerk/moz.build
	${REINPLACE_CMD} -e 's/"files":{[^}]*}/"files":{}/' \
		 ${WRKSRC}/third_party/rust/libc/.cargo-checksum.json
	echo "DEFINES['MOZ_DISABLE_NSWIFI_SCANNER'] = True" >> ${WRKSRC}/moz.build

post-install:
	${INSTALL_DATA} ${FIREFOX_DESKTOP} ${PREFIX}/share/applications/
	${MKDIR} ${PREFIX}/share/pixmaps
	${LN} -sf ${FIREFOX_ICON_SRC} ${PREFIX}/share/pixmaps/${FIREFOX_ICON}

.include <bsd.port.mk>
