PORTNAME=	frameworks
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	x11 kde
PKGNAMEPREFIX=	kf5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 frameworks meta port
WWW=		https://api.kde.org/frameworks/index.html

USES=		metaport kde:5 qt:5
USE_KDE=	${_USE_FRAMEWORKS_ALL}
# pull bsd.qt.mk for QT_PLUGINDIR in the kf5-dependencies
USE_QT=		#

.include <bsd.port.mk>
