PORTNAME=	node
PORTVERSION=	${NODEJS_PORTVERSION}
DISTVERSIONPREFIX=	v
CATEGORIES=	www
MASTER_SITES=	https://nodejs.org/dist/v${PORTVERSION}/
PKGNAMESUFFIX=	${PORTVERSION:R:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	V8 JavaScript for client and server
WWW=		https://nodejs.org/ \
		https://github.com/nodejs/node

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_SSL=	libressl libressl-devel
BROKEN_SSL_REASON=	Node.js ${PORTVERSION:R:R}.x requires OpenSSL or the BUNDLED_SSL option enabled
ONLY_FOR_ARCHS=	aarch64 amd64 armv6 armv7 i386 powerpc64 powerpc64le

BUILD_DEPENDS=	brotli>=1.0.9,1:archivers/brotli \
		c-ares>=1.17.2:dns/c-ares \
		libnghttp2>=1.45.1:www/libnghttp2 \
		libuv>=1.42.0:devel/libuv \
		objdump:devel/binutils
LIB_DEPENDS=	libbrotlidec.so:archivers/brotli \
		libcares.so:dns/c-ares \
		libnghttp2.so:www/libnghttp2 \
		libuv.so:devel/libuv

USES=		compiler:c++11-lib gmake localbase pkgconfig python:build shebangfix tar:xz

CONFIGURE_ARGS=	--prefix=${PREFIX:S|^${DESTDIR}||} \
		--shared-brotli \
		--shared-cares \
		--shared-libuv \
		--shared-nghttp2 \
		--shared-zlib \
		--without-npm \
		--dest-os=freebsd
HAS_CONFIGURE=	yes
MAKE_ENV=	CC.host="${CCACHE_BIN} ${CC}" \
		CFLAGS.host="${CFLAGS}" \
		CXX.host="${CCACHE_BIN} ${CXX}" \
		CXXFLAGS.host="${CXXFLAGS}" \
		LDFLAGS.host="${LDFLAGS}" \
		LINK.host="${CXX}"
REINPLACE_ARGS=	-i ''

CONFLICTS_INSTALL=	node[0-9][0-9]

SHEBANG_FILES=	deps/v8/third_party/inspector_protocol/*.py \
		deps/v8/tools/*.py \
		tools/*.py \
		tools/inspector_protocol/*.py

OPTIONS_DEFINE=	BUNDLED_SSL DOCS ICU JIT
OPTIONS_DEFAULT=ICU JIT
OPTIONS_SUB=	yes
BUNDLED_SSL_DESC=	Use bundled OpenSSL implementation from node.js
JIT_DESC=		Use Just In Time compiler

BUNDLED_SSL_CONFIGURE_OFF=	--openssl-use-def-ca-store --shared-openssl
BUNDLED_SSL_RUN_DEPENDS_OFF=	ca_root_nss>=0:security/ca_root_nss
BUNDLED_SSL_USES_OFF=	ssl
ICU_BUILD_DEPENDS=	icu>=69.1:devel/icu
ICU_CONFIGURE_ON=	--with-intl=system-icu
ICU_LIB_DEPENDS=	libicui18n.so:devel/icu
JIT_CONFIGURE_OFF=	--v8-lite-mode

.include "Makefile.version"
.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MBUNDLED_SSL} && ${ARCH} != amd64
CONFIGURE_ARGS+=--openssl-no-asm
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/tools/v8_gypfiles/v8.gyp

post-configure:
	# Post-process Makefile and *.mk files created by node-gyp and remove
	# all occurrences of -I${LOCALBASE}/include. C*FLAGS include this
	# before all -I../deps/* for bundled code. This can cause build
	# breakages if the dependency is installed in ${LOCALBASE}. The
	# USES+=localbase # above will ensure that we pick up includes for real
	# external dependencies.
	${FIND} ${WRKSRC}/out -type f -print0 | ${XARGS} -0 ${REINPLACE_CMD} -e "s|-I${LOCALBASE}/include||g"

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/node

.include <bsd.port.mk>
