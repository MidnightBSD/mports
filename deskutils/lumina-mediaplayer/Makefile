PORTNAME=	lumina-mediaplayer
DISTVERSIONPREFIX=	v
DISTVERSION=	1.6.2
PORTREVISION=	2
CATEGORIES=	deskutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Streaming media player from the Lumina Desktop
WWW=		https://lumina-desktop.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/../../../LICENSE

USES=		compiler:c++11-lang desktop-file-utils gl gstreamer qmake qt:5
USE_GL=		gl
USE_GSTREAMER=	gl
USE_QT=		buildtools:build core concurrent gui \
		multimedia network svg widgets x11extras
USE_GITHUB=	yes
GH_ACCOUNT=	lumina-desktop
GH_PROJECT=	lumina

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USE=	qt=linguist:build
NLS_QMAKE_ON=	CONFIG+=WITH_I18N

WRKSRC_SUBDIR=	src-qt5/desktop-utils/${PORTNAME}

.include <bsd.port.mk>
