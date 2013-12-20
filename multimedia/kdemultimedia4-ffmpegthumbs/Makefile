# $MidnightBSD$

PORTNAME=	ffmpegthumbs
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	multimedia kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
PKGNAMEPREFIX=	kdemultimedia-
DIST_SUBDIR=	KDE/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FFmpeg-based thumbnail generator for video files
LICENSE=	gpl2

LIB_DEPENDS=	swscale${FFMPEG_SUFFIX}:${PORTSDIR}/multimedia/ffmpeg${FFMPEG_SUFFIX}

CONFLICTS_INSTALL=	kdemultimedia-4.[1-8].*

USES=		cmake:outsource pkgconfig
USE_KDE4=	automoc4 kdehier kdelibs kdeprefix
USE_QT4=	moc_build qmake_build rcc_build uic_build
USE_XZ=		yes

# supported versions: ffmpeg, ffmpeg-devel
# corresponding FFMPEG_SUFFIX: '1', '-devel'
FFMPEG_SUFFIX?=
CMAKE_ARGS+=	-DFFMPEG_SUFFIX=${FFMPEG_SUFFIX}

.include <bsd.port.mk>
