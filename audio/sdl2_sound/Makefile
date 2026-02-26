PORTNAME=	sdl2_sound
DISTVERSIONPREFIX=	v
DISTVERSION=	2.0.4
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstract SDL soundfile decoder
WWW=		https://icculus.org/SDL_sound/ \
		https://github.com/icculus/SDL_sound

LICENSE=	zlib
LICENSE_FILE_ZLIB=${WRKSRC}/LICENSE.txt

USES=		cmake sdl
USE_SDL=	sdl2
USE_GITHUB=	yes
GH_ACCOUNT=	icculus
GH_PROJECT=	SDL_sound
USE_LDCONFIG=	yes
CMAKE_OFF=	SDLSOUND_BUILD_DOCS

PORTDOCS=	*
PORTEXAMPLES=	*

OPTIONS_DEFINE=	MIDI DOCS EXAMPLES
OPTIONS_DEFAULT=MIDI

MIDI_DESC=	MIDI support
MIDI_CMAKE_BOOL=SDLSOUND_DECODER_MIDI
MIDI_VARS=	LICENSE+=artistic \
		LICENSE_COMB=multi \
		LICENSE_FILE_ART10=${WRKSRC}/src/timidity/COPYING

post-install:
	@cd ${PREFIX}/bin && ${MV} playsound playsound2

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} README.md docs/CHANGELOG.txt docs/CREDITS.txt ${FAKE_DESTDIR}${DOCSDIR}/

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.c ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
