PORTNAME=	webrtc-audio-processing
DISTVERSION=	1.3
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	https://freedesktop.org/software/pulseaudio/${PORTNAME}/

PATCH_SITES=	https://gitlab.freedesktop.org/pulseaudio/${PORTNAME}/-/commit/
PATCHFILES+=	2083c9a5dd34.patch:-p1 # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/6
PATCHFILES+=	d49a0855a33b.patch:-p1 # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/17
PATCHFILES+=	f29ff57d6ccd.patch:-p1 # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/17
PATCHFILES+=	c18b3945a1cc.patch:-p1 # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/17

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AudioProcessing module from WebRTC project
WWW=		https://freedesktop.org/software/pulseaudio/webrtc-audio-processing/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	abseil>0:devel/abseil
RUN_DEPENDS=	abseil>0:devel/abseil # pkgconfig

USES=		compiler:c++17-lang meson pkgconfig
USE_LDCONFIG=	yes
CFLAGS_i386=	-msse # https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/issues/5

post-patch:
	${REINPLACE_CMD} -e 's|dragonfly|midnightbsd|g' ${WRKSRC}/meson.build

.include <bsd.port.mk>
