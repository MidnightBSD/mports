PORTNAME=	kholidays
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	net kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE library for calendar holidays

LICENSE=	lgpl2.1

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz
USE_KDE=	init \
		ecm:build
USE_QT=		core declarative network \
		buildtools:build qmake:build
USE_LDCONFIG=	yes

.include <bsd.port.mk>
