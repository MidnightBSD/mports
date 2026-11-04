PORTNAME=	fluent-bit
DISTVERSIONPREFIX=	v
DISTVERSION=	3.2.10
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and lightweight data forwarder
WWW=		https://fluentbit.io/

LICENSE=	Apache-2.0

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libsasl2.so:security/cyrus-sasl2 \
		libyaml.so:textproc/libyaml \
		libzstd.so:archivers/zstd

USES=		bison cmake:noninja compiler:c11 gmake localbase:ldflags ssl
USE_GITHUB=	yes
GH_ACCOUNT=	fluent
USE_RC_SUBR=	${PORTNAME}

CMAKE_ARGS=	-DFLB_DEBUG=Off \
		-DFLB_TRACE=Off
LDFLAGS+=	-lexecinfo

OPTIONS_DEFINE=		LUA_FILTER PGSQL SSL
OPTIONS_DEFAULT=	LUA_FILTER PGSQL SSL
LUA_FILTER_DESC=	Support for modifying incoming records using Lua scripts

LUA_FILTER_USES=	luajit:luajit-devel pkgconfig
LUA_FILTER_CMAKE_ON=	-DFLB_FILTER_LUA=On \
			-DFLB_LUAJIT=On \
			-DFLB_PREFER_SYSTEM_LIB_LUAJIT=On
LUA_FILTER_CMAKE_OFF=	-DFLB_LUAJIT=Off

PGSQL_USES=		pgsql
PGSQL_CMAKE_ON=		-DFLB_OUT_PGSQL=On
PGSQL_CMAKE_OFF=	-DFLB_OUT_PGSQL=Off

SSL_CMAKE_ON=	-DFLB_TLS=On
SSL_CMAKE_OFF=	-DFLB_TLS=Off

.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=int-conversion

post-patch:
	${LN} -s ${WRKSRC}/lib/wasm-micro-runtime-WAMR-1.3.3/core/shared/platform/freebsd ${WRKSRC}/lib/wasm-micro-runtime-WAMR-1.3.3/core/shared/platform/midnightbsd

post-install:
	${MV} ${ETCDIR}/${PORTNAME}.conf ${ETCDIR}/${PORTNAME}.conf.sample
	${MV} ${ETCDIR}/parsers.conf ${ETCDIR}/parsers.conf.sample

do-test-LUA_FILTER-on:
	${FAKE_DESTDIR}${PREFIX}/bin/fluent-bit --help 2>/dev/null | ${GREP} -w -q lua

.include <bsd.port.mk>
