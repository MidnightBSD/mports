PORTNAME=	klickety
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	games kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	${${PORTNAME:tu}_DESC}
WWW=		https://www.kde.org/applications/games/

USES=		cmake compiler:c++11-lang gettext kde:6 qt:6 shebangfix tar:xz \
		xorg
SHEBANG_FILES=	src/klickety-2.0-inherit-ksame-highscore.pl
USE_KDE=	auth bookmarks codecs completion config configwidgets \
		coreaddons crash dbusaddons doctools i18n itemviews jobwidgets \
		kio libkdegames notifications notifyconfig service solid \
		widgetsaddons windowsystem xmlgui \
		ecm:build
USE_QT=		base declarative
USE_XORG=	x11

OPTIONS_DEFINE=	DOCS

.include <${.CURDIR}/../kdegames/Makefile.common>
.include <bsd.port.mk>
