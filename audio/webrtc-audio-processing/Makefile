PORTNAME=	webrtc-audio-processing
PORTVERSION=	0.3.1
CATEGORIES=	audio
MASTER_SITES=	https://freedesktop.org/software/pulseaudio/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AudioProcessing module from WebRTC project

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf compiler:c++11-lib libtool pkgconfig tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
