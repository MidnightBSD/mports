PORTNAME=	spotify-qt
PORTVERSION=	3.7
DISTVERSIONPREFIX=	v
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Spotify client using Qt
WWW=		https://github.com/kraxarn/spotify-qt

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/license

RUN_DEPENDS=	spotifyd:audio/spotifyd

USES=		cmake compiler:c++11-lang qt:5 ssl
USE_GITHUB=	yes
GH_ACCOUNT=	kraxarn
USE_QT=		core dbus gui network svg widgets buildtools:build qmake:build

PLIST_FILES=	bin/spotify-qt \
		share/applications/spotify-qt.desktop \
		share/icons/hicolor/scalable/apps/spotify-qt.svg

.include <bsd.port.mk>
