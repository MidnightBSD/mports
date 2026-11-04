PORTNAME=	threadweaver
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 helper for multithreaded programming

LICENSE=	lgpl2.1+

USES=		cmake compiler:c++11-lib kde:5 qt:5 tar:xz
USE_KDE=	ecm:build
USE_QT=		core widgets xml \
		buildtools:build qmake:build testlib:build

.include <bsd.port.mk>
