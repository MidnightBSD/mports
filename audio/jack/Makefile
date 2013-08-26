# $MidnightBSD: mports/audio/jack/Makefile,v 1.12 2011/12/15 00:45:41 laffer1 Exp $

PORTNAME=	jackit
PORTVERSION=	0.121.3
PORTREVISION=	0
CATEGORIES=	audio
MASTER_SITES=	http://jackaudio.org/downloads/
DISTNAME=	jack-audio-connection-kit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A low-latency audio server

LICENSE=	gpl2

LIB_DEPENDS=	portaudio.0:${PORTSDIR}/audio/portaudio \
		sndfile.1:${PORTSDIR}/audio/libsndfile \
		samplerate.1:${PORTSDIR}/audio/libsamplerate
#		celt.0:${PORTSDIR}/audio/celt

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USES=		pathfix

CONFIGURE_ENV=	LIBS="-pthread"
CONFIGURE_ARGS=	--enable-portaudio \
		--with-default-tmpdir=/tmp
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

LATEST_LINK=	jack

MAN1=		jackd.1 jackstart.1

OPTIONS_DEFINE=	ALSA DOXYGEN

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOXYGEN}
BUILD_DEPENDS=	doxygen:${PORTSDIR}/devel/doxygen
PLIST_SUB+=	DOCS=""
.else
CONFIGURE_ENV+=	ac_cv_prog_HAVE_DOXYGEN="false"
PLIST_SUB+=	DOCS="@comment "
.endif

.if exists(${LOCALBASE}/lib/libreadline.so)
LIB_DEPENDS+=	readline:${PORTSDIR}/devel/readline
.endif

.if ${PORT_OPTIONS:MALSA}
LIB_DEPENDS+=	asound:${PORTSDIR}/audio/alsa-lib
PLIST_SUB+=	ALSA=""
.else
CONFIGURE_ARGS+=	--disable-alsa
PLIST_SUB+=	ALSA="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|define USE_MLOCK|undef USE_MLOCK|' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s,-lpthread,-pthread," \
		${WRKSRC}/configure ${WRKSRC}/libjack/Makefile.in \
		${WRKSRC}/jackd/Makefile.in \
		${WRKSRC}/example-clients/Makefile.in ${WRKSRC}/jack.pc.in
	@${REINPLACE_CMD} -e "s,-lrt,," ${WRKSRC}/libjack/Makefile.in \
		${WRKSRC}/jackd/Makefile.in \
		${WRKSRC}/example-clients/Makefile.in
	@${REINPLACE_CMD} -e "s,-ldl,," ${WRKSRC}/jackd/Makefile.in \
		${WRKSRC}/example-clients/Makefile.in
	@${REINPLACE_CMD} -e 's|md5sum|md5 -q|g' \
		${WRKSRC}/jackd/Makefile.in
	@${RM} -f ${WRKSRC}/doc/reference/html/*

post-build:
	@${RM} -f ${WRKSRC}/doc/reference/html/dir__2F*

.include <bsd.port.mk>
