PORTNAME=	syndication
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
PORTEPOCH=	1
CATEGORIES=	net kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE RSS feed handling library

LICENSE=	lgpl2.1

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz
USE_KDE=	codecs service \
		ecm:build
USE_QT=		core xml \
		buildtools:build qmake:build
USE_LDCONFIG=	yes

.include <bsd.port.mk>
