# $MidnightBSD$

PORTNAME=	c-ares
PORTVERSION=	1.12.0
PORTREVISION=	0
CATEGORIES=	dns
MASTER_SITES=	http://c-ares.haxx.se/download/ \
		http://obsd.isc.org/pub/OpenBSD/distfiles/ \
		http://mirrors.rit.edu/zi/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Asynchronous DNS resolver library

LICENSE=	mit

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-werror
INSTALL_TARGET=	install-strip
SSP_UNSAFE=	Refuses -l in LDFLAGS
USES=		libtool pathfix compiler:c++11-lang
USE_LDCONFIG=	yes

PROGRAMS=	acountry adig ahost

OPTIONS_DEFINE=		CONFIG_INFO DEBUG HIDE_SYMBOLS OPTIMIZED_CFLAGS
OPTIONS_DEFAULT=	CONFIG_INFO HIDE_SYMBOLS

CONFIG_INFO_DESC=	Add the ares_config_info patch
HIDE_SYMBOLS_DESC=	Hide internal library symbols
OPTIMIZED_CFLAGS_DESC=	Build with compiler optimizations

CONFLICTS=		ares-1.*

MAKE_JOBS_UNSAFE=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MCONFIG_INFO}
EXTRA_PATCHES+=	${FILESDIR}/ares-config-info.patch
#PKGNAMESUFFIX=	-config
.endif

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=--enable-debug
.else
CONFIGURE_ARGS+=--disable-debug
.endif

.if ${PORT_OPTIONS:MHIDE_SYMBOLS}
CONFIGURE_ARGS+=--enable-symbol-hiding
.else
CONFIGURE_ARGS+=--disable-symbol-hiding
.endif

.if ${PORT_OPTIONS:MOPTIMIZED_CFLAGS}
CONFIGURE_ARGS+=--enable-optimize
.else
CONFIGURE_ARGS+=--disable-optimize
.endif

post-install:
	${INSTALL_PROGRAM} ${PROGRAMS:S@^@${WRKSRC}/.libs/@} ${PREFIX}/bin/

.include <bsd.port.mk>
