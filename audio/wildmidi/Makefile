PORTNAME=	wildmidi
PORTVERSION=	0.4.3
DISTVERSIONPREFIX=	${PORTNAME}-
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple software midi player and core softsynth library
WWW=		https://www.mindwerks.net/projects/wildmidi/

# player: GPLv3, library: LGPL3
LICENSE=	lgpl3

USES=		cmake cpe
CPE_VENDOR=	mindwerks
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	Mindwerks

OPTIONS_SUB=	yes
OPTIONS_RADIO=	BACKEND
OPTIONS_RADIO_BACKEND=	ALSA OPENAL OSS
OPTIONS_DEFINE=	PLAYER PLAYERSTATIC STATIC
OPTIONS_DEFAULT=	ALSA PLAYER

STATIC_CMAKE_BOOL=	WANT_STATIC

PLAYER_DESC=	Simple player
PLAYERSTATIC_DESC=	Simple player using STATIC libWildMidi
BACKEND_DESC=	Sound system PLAYER and PLAYERSTATIC use
PLAYER_CMAKE_BOOL=	WANT_PLAYER
PLAYERSTATIC_CMAKE_BOOL=	WANT_PLAYERSTATIC
PLAYERSTATIC_IMPLIES=	STATIC
ALSA_CMAKE_BOOL=	WANT_ALSA
OPENAL_CMAKE_BOOL=	WANT_OPENAL
OSS_CMAKE_BOOL=	WANT_OSS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPLAYER} || ${PORT_OPTIONS:MPLAYERSTATIC}
LICENSE+=	gpl3
LICENSE_COMB=	multi
.  if ${PORT_OPTIONS:MOPENAL}
USES+=	openal:al
.  elif ${PORT_OPTIONS:MALSA}
LIB_DEPENDS+=	libasound.so:audio/alsa-lib
.  endif
.endif

post-patch:
	${REINPLACE_CMD} -e "/^dir \/usr\/share\//{" \
		-e "s|/usr/share/midi/freepats|${LOCALBASE}/share/freepats|;" \
		-e "h; x; s|^|# |; s|freepats|guspat|; H; s|guspat|eawpats|; H;" \
		-e "s|eawpats|eawplus|; H; x;}" ${WRKSRC}/cfg/wildmidi.cfg
	${REINPLACE_CMD} -e 's@/etc/wildmidi/@${DATADIR}/@' \
		-e 's@/etc/@${DATADIR}/@' ${WRKSRC}/docs/man/man1/wildmidi.1 \
		${WRKSRC}/docs/man/man5/wildmidi.cfg.5 \
		${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} \
		-e '/pkgconfig/s/$${WILDMIDILIB_INSTALLDIR}/libdata/' \
		${WRKSRC}/src/CMakeLists.txt

pre-install:
	@${RM} ${WRKSRC}/docs/man/man1/wildmidi.1${REINPLACE_ARGS:S/-i//} \
		${WRKSRC}/docs/man/man5/wildmidi.cfg.5${REINPLACE_ARGS:S/-i//}
	${MKDIR} ${STAGEDIR}${DATADIR} ; \
	${CP} ${WRKSRC}/cfg/wildmidi.cfg ${STAGEDIR}${DATADIR}/wildmidi.cfg.sample

.include <bsd.port.mk>
