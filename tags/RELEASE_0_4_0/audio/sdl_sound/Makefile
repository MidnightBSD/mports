# $MidnightBSD: mports/audio/sdl_sound/Makefile,v 1.4 2011/02/02 20:03:23 laffer1 Exp $

PORTNAME=	sdl_sound
PORTVERSION=	1.0.3
CATEGORIES=	audio
MASTER_SITES=	http://offload1.icculus.org:9090/SDL_sound/downloads/ \
		http://offload2.icculus.org:9090/SDL_sound/downloads/
DISTNAME=	SDL_sound-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A SDL audio library and player for some popular sound file formats
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_SDL=	sdl
CONFIGURE_ARGS=	--program-prefix=""
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd7.0

OPTIONS=	FLAC "Enable flac support" on \
		MIKMOD "Enable mikmod support" on \
		PHYSFS "Enable physfs support" on \
		SMPEG "Enable smpeg support" on \
		SPEEX "Enable speex support" on \
		MIDI "Enable MIDI support" on \
		VORBIS "Enable Ogg Vorbis support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_FLAC)
LIB_DEPENDS+=	FLAC.10:${PORTSDIR}/audio/flac
.else
CONFIGURE_ARGS+=--disable-flac
.endif

.if !defined(WITHOUT_MIKMOD)
LIB_DEPENDS+=	mikmod.2:${PORTSDIR}/audio/libmikmod
.else
CONFIGURE_ARGS+=--disable-mikmod
.endif

.if !defined(WITHOUT_PHYSFS)
LIB_DEPENDS+=	physfs.1:${PORTSDIR}/devel/physfs
.else
CONFIGURE_ARGS+=--disable-physfs
.endif

.if !defined(WITHOUT_SMPEG)
LIB_DEPENDS+=	smpeg.1:${PORTSDIR}/multimedia/smpeg
CONFIGURE_ARGS+=--disable-mpglib
.else
CONFIGURE_ARGS+=--disable-smpeg
.endif

.if !defined(WITHOUT_SPEEX)
LIB_DEPENDS+=	speex.1:${PORTSDIR}/audio/speex
.else
CONFIGURE_ARGS+=--disable-speex
.endif

.if !defined(WITHOUT_MIDI)
RUN_DEPENDS+=	${LOCALBASE}/lib/timidity/goemon.cfg:${PORTSDIR}/audio/timidity
BUILD_DEPENDS+=	${LOCALBASE}/lib/timidity/goemon.cfg:${PORTSDIR}/audio/timidity
.else
CONFIGURE_ARGS+=--disable-midi
.endif

.if !defined(WITHOUT_VORBIS)
LIB_DEPENDS+=	vorbis.4:${PORTSDIR}/audio/libvorbis
.else
CONFIGURE_ARGS+=--disable-ogg
.endif

.if defined(WITHOUT_SMPEG)
pre-everything::
	@${ECHO_CMD}
	@${ECHO_CMD} "WARNING: the built-in MP3 support is currently broken, consider enabling the SMPEG option to use that library instead." | ${FMT}
	@${ECHO_CMD}
.endif

.include <bsd.port.post.mk>
