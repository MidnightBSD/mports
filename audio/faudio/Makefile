PORTNAME=	FAudio
DISTVERSION=	21.01
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accuracy-focused XAudio reimplementation
WWW=		https://fna-xna.github.io/

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c11 sdl
USE_GITHUB=	yes
GH_ACCOUNT=	FNA-XNA
USE_LDCONFIG=	yes
USE_SDL=	sdl2

PLIST_SUB=	SOVERSION=${DISTVERSION:S,., ,g:[1..2]:ts.}

OPTIONS_DEFINE=		GSTREAMER
OPTIONS_DEFAULT=	GSTREAMER

GSTREAMER_DESC=	WMA/XMA support via GStreamer

GSTREAMER_USES=		gettext-runtime gnome gstreamer pkgconfig
GSTREAMER_USE=		GNOME=glib20
GSTREAMER_CMAKE_BOOL=	GSTREAMER

NO_TEST=	yes

.include <bsd.port.mk>
