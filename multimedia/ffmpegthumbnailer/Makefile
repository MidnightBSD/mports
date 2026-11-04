PORTNAME=	ffmpegthumbnailer
DISTVERSIONPREFIX=	v
DISTVERSION=	2.3.1
CATEGORIES=	multimedia graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight video thumbnailer that can be used by file managers
WWW=		https://github.com/dirkvdb/ffmpegthumbnailer

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpng.so:graphics/png \
		libavformat.so:multimedia/ffmpeg

USES=		cmake:testing compiler:c++14-lang gnome jpeg localbase pathfix pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	dirkvdb

USE_GNOME=	glib20
USE_LDCONFIG=	yes

EXTRACT_CMD=	${SETENV} LC_ALL=en_US.UTF-8 /usr/bin/bsdtar

CMAKE_ON=	ENABLE_GIO
CMAKE_OFF=	ENABLE_TESTS
CMAKE_TESTING_ON=	ENABLE_TESTS

OPTIONS_DEFINE=		AUDIO_THUMBNAILER THUMBNAILER
OPTIONS_DEFAULT=	AUDIO_THUMBNAILER THUMBNAILER
OPTIONS_SUB=		yes

AUDIO_THUMBNAILER_DESC=	Register as a system thumbnailer for audio files
THUMBNAILER_DESC=	Register as a system thumbnailer for video files

AUDIO_THUMBNAILER_CMAKE_BOOL=	ENABLE_AUDIO_THUMBNAILER
THUMBNAILER_CMAKE_BOOL=		ENABLE_THUMBNAILER

.include <bsd.port.mk>
