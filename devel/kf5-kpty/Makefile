PORTNAME=	kpty
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 pty abstraction

USES=		cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz
USE_KDE=	coreaddons i18n \
		ecm:build
USE_QT=		core \
		buildtools:build qmake:build

.include <bsd.port.mk>
