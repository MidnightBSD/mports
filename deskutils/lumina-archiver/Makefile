PORTNAME=	lumina-archiver
DISTVERSIONPREFIX=	v
DISTVERSION=	1.6.2
PORTREVISION=	1
CATEGORIES=	deskutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Archive manager from the Lumina Desktop
WWW=		https://lumina-desktop.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/../../../LICENSE

USES=		compiler:c++11-lang desktop-file-utils gl qmake qt:5
USE_QT=		buildtools:build concurrent core gui \
		multimedia network svg widgets x11extras
USE_GL=		gl
USE_GITHUB=	yes
GH_ACCOUNT=	lumina-desktop
GH_PROJECT=	lumina

OPTIONS_DEFINE=		NLS
OPTIONS_SUB=		yes

NLS_USE=	qt=linguist:build
NLS_QMAKE_ON=	CONFIG+=WITH_I18N

CONFLICTS_INSTALL=	lumina-1.2.*

WRKSRC_SUBDIR=	src-qt5/desktop-utils/${PORTNAME}

.include <bsd.port.mk>
