PORTNAME=	picmi
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	games kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	${${PORTNAME:tu}_DESC}
WWW=		https://games.kde.org/

USES=		cmake compiler:c++11-lang gettext kde:6 qt:6 tar:xz xorg
USE_KDE=	auth codecs completion config configwidgets coreaddons crash \
		dbusaddons doctools i18n jobwidgets kdeclarative kio \
		libkdegames newstuff service solid widgetsaddons windowsystem \
		xmlgui \
		ecm:build
USE_QT=		base declarative
USE_XORG=	x11

OPTIONS_DEFINE=	DOCS

.include <${.CURDIR}/../kdegames/Makefile.common>
.include <bsd.port.mk>
