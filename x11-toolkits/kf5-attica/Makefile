PORTNAME=	attica
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11-toolkits kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Collaboration Services API library

LICENSE=	lgpl2.1 lgpl3
LICENSE_COMB=	dual

USES=		cmake compiler:c++11-lib kde:5 pathfix qt:5 tar:xz
USE_KDE=	ecm:build
USE_QT=		core network \
		buildtools:build qmake:build testlib:build

.include <bsd.port.mk>
