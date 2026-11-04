PORTNAME=	kunitconversion
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 library for unit conversion

USES=		cmake compiler:c++11-lib gettext kde:5 kfhack pkgconfig qt:5 tar:xz
USE_KDE=	i18n \
		ecm:build
USE_QT=		core network \
		buildtools:build qmake:build

.include <bsd.port.mk>
