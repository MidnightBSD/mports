PORTNAME=	karchive
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	archivers kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 library that provides classes for handling archive formats

LICENSE=	lgpl

USES=		cmake compiler:c++11-lib kde:5 qt:5 tar:xz
USE_KDE=	ecm:build
USE_QT=		core linguisttools \
		buildtools:build qmake:build

.include <bsd.port.mk>
