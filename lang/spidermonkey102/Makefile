PORTNAME=	spidermonkey
DISTVERSION=	102.4.0
PORTREVISION=	0
CATEGORIES=	lang
MASTER_SITES=	MOZILLA/firefox/releases/${DISTVERSION}esr/source
PKGNAMESUFFIX=	${SP_VER}
DISTNAME=	firefox-${DISTVERSION}esr.source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standalone JavaScript based from Mozilla 102-esr
WWW=		https://spidermonkey.dev/

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.35:lang/${RUST_DEFAULT} \
		autoconf2.13:devel/autoconf2.13 \
		rust-cbindgen>=0.8.7:devel/rust-cbindgen
LIB_DEPENDS=	libffi.so:devel/libffi \
		libicudata.so:devel/icu \
		libnspr4.so:devel/nspr

USES=		compiler:c++17-lang gmake localbase pathfix pkgconfig \
		python:build readline tar:xz
USE_LDCONFIG=	yes
SP_VER=		102
HAS_CONFIGURE=	yes

WRKSRC=			${WRKDIR}/firefox-${DISTVERSION}/
PATCH_WRKSRC=		${WRKDIR}/firefox-${DISTVERSION}/
CONFIGURE_OUTSOURCE=	yes

CONFIGURE_ARGS=	--enable-application=js \
		--disable-debug \
		--disable-debug-symbols \
		--disable-jemalloc \
		--disable-tests \
		--enable-optimize \
		--enable-readline \
		--enable-shared-js \
		--prefix=${PREFIX:Q} \
		--target=${CONFIGURE_TARGET} \
		--with-intl-api \
		--with-system-icu \
		--with-system-nspr \
		--with-system-zlib

CONFIGURE_ENV=	HOST_CC=${CC} \
		HOST_CXX=${CXX}

BINARY_ALIAS=	python3=${PYTHON_CMD}
PLIST_SUB=	SP_VER=${SP_VER}

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_TARGET=	x86_64-portbld-freebsd12.4
.else
CONFIGURE_TARGET=${ARCH}-portbld-freebsd12.4
.endif

# Require newer Clang than what's in base system unless user opted out
# or the base system is new enough.
.if ${CHOSEN_COMPILER_TYPE} == gcc
CONFIGURE_ENV+=	LLVM_CONFIG=llvm-config${LLVM_DEFAULT} \
		LLVM_OBJDUMP=llvm-objdump${LLVM_DEFAULT}
BUILD_DEPENDS+=	${LOCALBASE}/bin/llvm-objdump${LLVM_DEFAULT}:devel/llvm${LLVM_DEFAULT}
USE_GCC=	yes
.elif ${CC} == cc && ${CXX} == c++ && exists(/usr/lib/libc++.so) && \
	${COMPILER_VERSION} < 80
CPP=		${LOCALBASE}/bin/clang-cpp${LLVM_DEFAULT}
CC=		${LOCALBASE}/bin/clang${LLVM_DEFAULT}
CXX=		${LOCALBASE}/bin/clang++${LLVM_DEFAULT}
CONFIGURE_ENV+=	LLVM_CONFIG=llvm-config${LLVM_DEFAULT} \
		LLVM_OBJDUMP=llvm-objdump${LLVM_DEFAULT}
BUILD_DEPENDS+=	${LOCALBASE}/bin/clang${LLVM_DEFAULT}:devel/llvm${LLVM_DEFAULT}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' ${WRKSRC}/js/moz.configure
	@${FIND} ${WRKSRC}/python/mozbuild -name *.py -exec \
		${REINPLACE_CMD} 's|"rU"|"r"|g' {} \;
	${REINPLACE_CMD} -e 's|midnightbsd"\$UNAME_RELEASE"|freebsd12.4|g' \
		${WRKSRC}/build/autoconf/config.guess ${WRKSRC}/build/autoconf/config.sub
	${REINPLACE_CMD} -e 's|DragonFly|MidnightBSD|g' \
		${WRKSRC}/testing/mozbase/mozinfo/mozinfo/mozinfo.py

pre-configure:
	(cd ${WRKSRC} && ${LOCALBASE}/bin/autoconf2.13)
	(cd ${WRKSRC}/js/src/ && ${LOCALBASE}/bin/autoconf2.13)

post-install:
	${RM} ${STAGEDIR}${PREFIX}/lib/libjs_static.ajs
	${LN} -fs libmozjs-${SP_VER}.so ${STAGEDIR}${PREFIX}/lib/libmozjs-${SP_VER}.so.1
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libmozjs-${SP_VER}.*

.include <bsd.port.post.mk>
