# $MidnightBSD$

PORTNAME=	c-ares
PORTVERSION=	1.10.0
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://c-ares.haxx.se/download/ \
		http://obsd.isc.org/pub/OpenBSD/distfiles/ \
		http://mirrors.rit.edu/zi/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Asynchronous DNS resolver library

LICENSE=	mit

OPTIONS=	CONFIG_INFO	"Add the ares_config_info patch" ON \
		DEBUG		"Build with debug information" OFF \
		HIDE_SYMBOLS	"Hide internal library symbols" ON \
		OPTIMIZED_CFLAGS	"Build with compiler optimizations" OFF

CONFLICTS=	ares-1.*

MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.pre.mk>

.if defined(WITH_CONFIG_INFO)
EXTRA_PATCHES+=	${FILESDIR}/ares-config-info.patch
PKGNAMESUFFIX=	-config
.endif
.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.else
CONFIGURE_ARGS+=	--disable-debug
.endif
.if defined(WITH_HIDE_SYMBOLS)
CONFIGURE_ARGS+=	--enable-symbol-hiding
.else
CONFIGURE_ARGS+=	--disable-symbol-hiding
.endif
.if defined(WITH_OPTIMIZED_CFLAGS)
CONFIGURE_ARGS+=	--enable-optimize
.else
CONFIGURE_ARGS+=	--disable-optimize
.endif

USE_LDCONFIG=	yes
SHLIB_VER=	3

MAKE_ENV=	SHLIB_VER="${SHLIB_VER}"
PLIST_SUB=	SHLIB_VER="${SHLIB_VER}"

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--enable-shared --disable-werror

PROGRAMS=	acountry adig ahost

post-install:
	${INSTALL_PROGRAM} ${PROGRAMS:S@^@${WRKSRC}/.libs/@} ${PREFIX}/bin/

.include <bsd.port.post.mk>
