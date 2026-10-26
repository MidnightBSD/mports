PORTNAME=	video-editing
DISTVERSION=	1.0
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video editing, compositing, and media production tools (meta port)
WWW=		https://www.midnightbsd.org/mports/

LICENSE=	bsd2

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	Selected Craft applications support only amd64

RUN_DEPENDS=	ffmpeg>=0:multimedia/ffmpeg \
		mediainfo>=0:multimedia/mediainfo \
		mpv>=0:multimedia/mpv

USES=		metaport

OPTIONS_DEFINE=		AUDACITY EFFECTCRAFT FILMCRAFT KDENLIVE PHOTOCRAFT \
			SOUNDCRAFT VECTORCRAFT
OPTIONS_DEFAULT=	EFFECTCRAFT FILMCRAFT PHOTOCRAFT SOUNDCRAFT

AUDACITY_DESC=		Audio recording and waveform editing
AUDACITY_RUN_DEPENDS=	audacity>=0:audio/audacity

EFFECTCRAFT_DESC=	Motion graphics and compositing with EffectCraft
EFFECTCRAFT_RUN_DEPENDS=	effectcraft>=0:multimedia/effectcraft

FILMCRAFT_DESC=		Video editing with FilmCraft
FILMCRAFT_RUN_DEPENDS=	filmcraft>=0:multimedia/filmcraft

KDENLIVE_DESC=		Video editing with Kdenlive
KDENLIVE_RUN_DEPENDS=	kdenlive>=0:multimedia/kdenlive

PHOTOCRAFT_DESC=		Still image editing with PhotoCraft
PHOTOCRAFT_RUN_DEPENDS=	photocraft>=0:graphics/photocraft

SOUNDCRAFT_DESC=		Audio production with SoundCraft
SOUNDCRAFT_RUN_DEPENDS=	soundcraft>=0:audio/soundcraft

VECTORCRAFT_DESC=	Vector graphics with VectorCraft
VECTORCRAFT_RUN_DEPENDS=	vectorcraft>=0:graphics/vectorcraft

.include <bsd.port.mk>
