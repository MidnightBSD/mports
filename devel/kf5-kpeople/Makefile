PORTNAME=	kpeople
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 library providing access to contacts

LICENSE=	lgpl2.1+

USES=		cmake compiler:c++11-lib gettext kde:5 kfhack qt:5 tar:xz
USE_KDE=	coreaddons i18n itemviews service widgetsaddons \
		ecm:build
USE_QT=		core dbus declarative gui network sql widgets \
		buildtools:build qmake:build

.include <bsd.port.mk>
