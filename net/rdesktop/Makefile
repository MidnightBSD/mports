PORTNAME=	rdesktop
PORTVERSION=	1.9.0
DISTVERSIONPREFIX=	v
CATEGORIES=	net comms

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDP client for Windows NT/2000/2003 Terminal Server
WWW=		http://www.rdesktop.org/

LICENSE=	gpl3

LIB_DEPENDS=	libgmp.so:math/gmp \
		libgnutls.so:security/gnutls \
		libnettle.so:security/nettle \
		libtasn1.so:security/libtasn1

USES=		autoreconf cpe gmake iconv pkgconfig xorg
USE_XORG=	x11 xcursor xrandr
USE_GITHUB=	yes

CONFIGURE_ARGS+=	${ICONV_CONFIGURE_ARG} \
			--disable-credssp
GNU_CONFIGURE=		yes
DOCS=			doc/*.txt doc/AUTHORS doc/TODO

OPTIONS_DEFINE=	AO DEBUG DOCS IPV6 SAMPLERATE SMARTCARD
SMARTCARD_DESC=	Enable SmartCard login via PCSC-lite

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MAO}
LIB_DEPENDS+=		libao.so:audio/libao
CONFIGURE_ARGS+=	--with-sound=libao
.else
CONFIGURE_ARGS+=	--with-sound=oss
.endif

.if exists(${LOCALBASE}/lib/libsamplerate.so) || ${PORT_OPTIONS:MSAMPLERATE}
LIB_DEPENDS+=	libsamplerate.so:audio/libsamplerate
.endif

.if ${PORT_OPTIONS:MIPV6}
CONFIGURE_ARGS+=	--with-ipv6
.endif

.if ${PORT_OPTIONS:MSMARTCARD}
LIB_DEPENDS+=	libpcsclite.so:devel/pcsc-lite
.else
CONFIGURE_ARGS+=	--disable-smartcard
.endif

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=	--with-debug \
			--with-debug-channel \
			--with-debug-clipboard \
			--with-debug-kbd \
			--with-debug-rdp5 \
			--with-debug-seamless \
			--with-debug-sound
.if ${PORT_OPTIONS:MSMARTCARD}
CONFIGURE_ARGS+=	--with-debug-smartcard
.endif

post-configure:
	${ECHO} "#define WITH_DEBUG_SERIAL 1" >> ${WRKSRC}/rdesktop.h
.endif

post-patch:
	@${REINPLACE_CMD} -e '/-o rdesktop/s,-lX11,& -lgmp,' \
		${WRKSRC}/Makefile.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rdesktop ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/rdesktop.1 ${STAGEDIR}${PREFIX}/share/man/man1
	@${MKDIR} ${STAGEDIR}${DATADIR}/keymaps
	${INSTALL_DATA} ${WRKSRC}/keymaps/* ${STAGEDIR}${DATADIR}/keymaps
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
