PORTNAME=	tor
DISTVERSION=	0.4.2.5
CATEGORIES=	security net ipv6
MASTER_SITES=	TOR

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Anonymizing overlay network for TCP

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c11 cpe gmake pkgconfig
USE_CSTD=	gnu99
CPE_VENDOR=	torproject
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-openssl-dir="${OPENSSLBASE}" --disable-asciidoc
CONFIGURE_ENV=	TOR_CPPFLAGS_libevent="-I${LOCALBASE}/include" \
		TOR_LDFLAGS_libevent="-L${LOCALBASE}/lib/" \
		TOR_LIBEVENT_LIBS="${TOR_LIBEVENT_LIBS}"

OPTIONS_DEFINE=	BUFFEREVENTS INSTR_DOWNLOADS \
		STATIC_TOR TCMALLOC TOR2WEB TRANSPARENT

BUFFEREVENTS_DESC=	Use libevent's buffered IO
INSTR_DOWNLOADS_DESC=	Instrument downloads for analysis
STATIC_TOR_DESC=	Build a static tor
TCMALLOC_DESC=		Use the tcmalloc memory allocation library
TOR2WEB_DESC=		Faster but non-anonymous hidden services
TRANSPARENT_DESC=	Transparent proxy support

OPTIONS_DEFAULT=	THREADS TRANSPARENT

USES=		ssl

USE_RC_SUBR=	tor
SUB_FILES=	pkg-message

GROUPS=		_tor
USERS=		_tor

CONFLICTS=	tor-devel-[0-9]*

NO_TEST=	yes

.include <bsd.mport.options.mk>

.if ( (${OSVERSION} < 4015) || \
(${OSVERSION} >= 4015) ) && !defined(USE_GCC) && empty(CC:T:M*gcc4*) && \
empty(PORT_OPTIONS:MSTATIC_TOR) && empty(ARCH:Mia64)
CONFIGURE_ARGS+=	--enable-gcc-hardening
.else
CONFIGURE_ARGS+=	--disable-gcc-hardening
.endif

.if ${PORT_OPTIONS:MBUFFEREVENTS}
CONFIGURE_ARGS+=	--enable-bufferevents
.else
CONFIGURE_ARGS+=	--disable-bufferevents
.endif

.if ${PORT_OPTIONS:MINSTR_DOWNLOADS}
CONFIGURE_ARGS+=	--enable-instrument-downloads
.else
CONFIGURE_ARGS+=	--disable-instrument-downloads
.endif

.if ${PORT_OPTIONS:MSTATIC_TOR}
BUILD_DEPENDS +=	${LOCALBASE}/lib/libevent.a:devel/libevent
CONFIGURE_ARGS+=	--enable-static-tor \
			--with-zlib-dir=/usr/lib --disable-linker-hardening
TOR_LIBEVENT_LIBS=	${LOCALBASE}/lib/libevent.a
.if ${PORT_OPTIONS:MBUFFEREVENTS}
TOR_LIBEVENT_LIBS:=	${LOCALBASE}/lib/libevent_openssl.a ${TOR_LIBEVENT_LIBS}
.endif
.else
CONFIGURE_ARGS+=	--enable-linker-hardening
LIB_DEPENDS+=		libevent.so:devel/libevent
TOR_LIBEVENT_LIBS=	-levent
.if ${PORT_OPTIONS:MBUFFEREVENTS}
TOR_LIBEVENT_LIBS:=	-levent_openssl ${TOR_LIBEVENT_LIBS}
.endif
.endif

.if ${PORT_OPTIONS:MTCMALLOC}
CONFIGURE_ARGS+=	--with-tcmalloc
.if ${PORT_OPTIONS:MSTATIC_TOR}
BUILD_DEPENDS +=	${LOCALBASE}/lib/libtcmalloc.so:devel/google-perftools
.else
LIB_DEPENDS+=		libtcmalloc.so:devel/google-perftools
.endif
.endif

.if ${PORT_OPTIONS:MTOR2WEB}
CONFIGURE_ARGS+=	--enable-tor2web-mode
.endif

.if ${PORT_OPTIONS:MTRANSPARENT}
CONFIGURE_ARGS+=	--enable-transparent
.else
CONFIGURE_ARGS+=	--disable-transparent
.endif

post-patch:
	@${REINPLACE_CMD} -E -e "s@-ltcmalloc@${LOCALBASE}/lib/libtcmalloc.so@" \
		-e "s@(-z) (relro|now)@-Wl,\1,\2@g" \
		${WRKSRC}/configure

post-configure:
	@${REINPLACE_CMD} -e '\|^nodist_man1_MANS =|s|$$|$$(install_mans:=.1)|' \
		${WRKSRC}/Makefile

.include <bsd.port.mk>
