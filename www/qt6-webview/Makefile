PORTNAME=	webview
PORTVERSION=	${QT6_VERSION}
PORTREVISION=	1
CATEGORIES=	www
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt component for displaying web content

LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon

USES=		cmake gl pkgconfig qt-dist:6
USE_GL=		gl opengl
USE_QT=		base declarative positioning webchannel webengine

.include <bsd.port.mk>
