PORTNAME=	webrtc-audio-processing
DISTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	https://freedesktop.org/software/pulseaudio/${PORTNAME}/

PATCH_SITES=	https://gitlab.freedesktop.org/pulseaudio/${PORTNAME}/-/commit/
PATCHFILES+=	2083c9a5dd34.patch:-p1 # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/6
PATCHFILES+=	3f9907f93d39.patch:-p1 # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/13
PATCHFILES+=	b34c1d5746ea.patch:-p1 # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/14

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AudioProcessing module from WebRTC project

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	cmake:devel/cmake
LIB_DEPENDS=	libabsl_strings.so:devel/abseil

USES=		compiler:c++17-lang meson
USE_LDCONFIG=	yes
CFLAGS_i386=	-msse # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/issues/5

post-patch:
	${REINPLACE_CMD} -e 's|dragonfly|midnightbsd|g' ${WRKSRC}/meson.build

.include <bsd.port.mk>
