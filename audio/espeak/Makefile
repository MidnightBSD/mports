# $MidnightBSD$
# $FreeBSD: ports/audio/espeak/Makefile,v 1.15 2007/08/06 13:33:16 nivit Exp $

PORTNAME=	espeak
PORTVERSION=	1.48.04
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION:R}
DISTNAME=	${PORTNAME}-${PORTVERSION}-source

MAINTAINER=	nivit@FreeBSD.org
COMMENT=	Software speech synthesizer

LICENSE=	gpl3

FAKE_OPTS+=	trueprefix

OPTIONS_DEFINE=	DOCS
OPTIONS_DEFAULT=	PORTAUDIO
OPTIONS_RADIO=	AUDIO_SYSTEM
OPTIONS_RADIO_AUDIO_SYSTEM=	PORTAUDIO PULSEAUDIO RUNTIME
RUNTIME_DESC=	Sound interface selected at runtime

PORTAUDIOLIB=	libportaudio.so:${PORTSDIR}/audio/portaudio
PULSEAUDIOLIB=	libpulse.so:${PORTSDIR}/audio/pulseaudio

PORTAUDIO_LIB_DEPENDS=	${PORTAUDIOLIB}
PULSEAUDIO_LIB_DEPENDS=	${PULSEAUDIOLIB}
RUNTIME_LIB_DEPENDS=	${PORTAUDIOLIB} \
			${PULSEAUDIOLIB}

PULSEAUDIO_USES=	compiler:c++0x
RUNTIME_USES=		compiler:c++0x

PULSEAUDIO_MAKE_ENV=	AUDIO="pulseaudio"
PORTAUDIO_MAKE_ENV=	AUDIO="portaudio"
RUNTIME_MAKE_ENV=	AUDIO="runtime"

CONFLICTS=	speak-1.[0-9]

CXXFLAGS+=	-I${LOCALBASE}/include
USES=		gmake zip
USE_LDCONFIG=	yes

WRKSRC=	${WRKDIR}/${DISTNAME}
BUILD_WRKSRC=	${WRKSRC}/src
INSTALL_WRKSRC=	${WRKSRC}/src

REINPLACE_FILES=	Makefile speech.h
REINPLACE_ARGS=	-i.bak -e "s|%%DATADIR%%|${DATADIR}|g"

.include <bsd.mport.options.mk>

post-patch:
	cd ${BUILD_WRKSRC} && ${REINPLACE_CMD} ${REINPLACE_FILES}
.if ${PORT_OPTIONS:MPORTAUDIO}
	${MV} ${WRKSRC}/src/portaudio19.h ${WRKSRC}/src/portaudio.h
.endif

post-install:
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${DOCSDIR}
	${STRIP_CMD} ${PREFIX}/bin/${PORTNAME}
	${STRIP_CMD} ${PREFIX}/lib/libespeak.so*

.include <bsd.port.mk>
