PORTNAME=	botan
DISTVERSION=	2.17.3
CATEGORIES=	security
MASTER_SITES=	http://botan.randombit.net/releases/
PKGNAMESUFFIX=	2
DISTNAME=	Botan-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable, easy to use and efficient C++ crypto library

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/license.txt

BROKEN_armv6=	include/arm_neon.h:28:2: error: "NEON support not enabled"

LIB_DEPENDS=	libboost_filesystem.so:devel/boost-libs

USES=		compiler:c++11-lang gmake shebangfix tar:xz
USE_LDCONFIG=	yes

SHEBANG_FILES=	configure.py src/python/botan2.py src/scripts/install.py

HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	configure.py
CONFIGURE_ARGS=		--cc=${COMPILER_TYPE} \
			--prefix=${PREFIX:Q} \
			--with-boost \
			--with-bzip2 \
			--with-external-includedir=${LOCALBASE}/include \
			--with-external-libdir=${LOCALBASE}/lib \
			--with-lzma \
			--with-zlib \
			--os=freebsd
LDFLAGS+=		-pthread

DOCSDIR=	${LOCALBASE}/share/doc/${PORTNAME}-${PORTVERSION}

_SOABIVER=	17
_SHLIBVER=	${DISTVERSION:S/./ /g:[2]}
_SHLIBVERPATCH=	${DISTVERSION:S/./ /g:[3]}
PLIST_SUB=	SOABIVER=${_SOABIVER} SHLIBVER=${_SHLIBVER} SHLIBVERPATCH=${_SHLIBVERPATCH}
PORTDOCS=	*

OPTIONS_DEFINE=		DOCS PYTHON SQLITE3 SSL
OPTIONS_DEFAULT=	SSL
OPTIONS_SUB=		yes

PYTHON_USES=		python
PYTHON_USES_OFF=	python:build
PYTHON_CONFIGURE_ON=	--with-python-versions=${PYTHON_VER}
PYTHON_CONFIGURE_OFF=	--no-install-python-module

SQLITE3_USES=		sqlite
SQLITE3_CONFIGURE_WITH=	sqlite3

SSL_USES=		ssl
SSL_CONFIGURE_WITH=	openssl

.include <bsd.mport.options.mk>

.if ${ARCH} == aarch64
CONFIGURE_ARGS+=	--cc-abi="-march=armv8-a+crypto"
.endif

CONFIGURE_ARGS+=	--without-os-features=getentropy,elf_aux_info

.if ${ARCH} == i386 || ${ARCH} == amd64
PLIST_SUB+=	HAS_RDRAND_RNG=""
.else
PLIST_SUB+=	HAS_RDRAND_RNG="@comment "
.endif

.if ${ARCH} == i386 || ${ARCH} == amd64
PLIST_SUB+=	HAS_PROCESSOR_RNG=""
.else
PLIST_SUB+=	HAS_PROCESSOR_RNG="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|^optimization_flags .*|optimization_flags "${CXXFLAGS}"|' \
		${WRKSRC}/src/build-data/cc/clang.txt

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/botan ${STAGEDIR}${PREFIX}/lib/libbotan-2.so.${_SOABIVER}.${_SHLIBVER}.${_SHLIBVERPATCH}

.include <bsd.port.mk>
