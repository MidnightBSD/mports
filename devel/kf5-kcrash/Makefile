PORTNAME=	kcrash
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 library to handle crash analysis and bug report from apps

LICENSE=	bsd3 lgpl2.1+
LICENSE_COMB=	multi

USES=		cmake compiler:c++11-lib kde:5 kfhack qt:5 tar:xz xorg
USE_KDE=	coreaddons \
		ecm:build
USE_QT=		core gui x11extras \
		buildtools:build qmake:build testlib:build
USE_XORG=	ice sm x11 xext

.include <bsd.port.mk>
