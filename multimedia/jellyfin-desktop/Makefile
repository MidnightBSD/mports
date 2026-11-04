PORTNAME=	jellyfin-desktop
DISTVERSIONPREFIX=	v
DISTVERSION=	2.0.0
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jellyfin Desktop Client
WWW=		https://github.com/jellyfin/jellyfin-desktop

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libcec.so:multimedia/libcec \
		libminizip.so:archivers/minizip \
		libmpv.so:multimedia/mpv

USES=		cmake gl iconv pkgconfig python:build qt:6 sdl xorg
USE_GITHUB=	yes
GH_ACCOUNT=	jellyfin
GH_TUPLE=	KDE:mpvqt:2ebbd38bf65d01be9c55d673ecd43c8bb9a6fc8e:mpvqt/external/mpvqt
USE_GL=		opengl
USE_QT=		base declarative positioning webchannel webengine
USE_SDL=	sdl2
USE_XORG=	ice sm x11 xext xrandr

CMAKE_ON=	USE_STATIC_MPVQT

.include <bsd.port.mk>
