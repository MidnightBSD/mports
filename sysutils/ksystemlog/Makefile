PORTNAME=	ksystemlog
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	sysutils kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE system log application
WWW=		https://kde.org/applications/system/ksystemlog/

USES=		cmake compiler:c++11-lang gettext kde:6 pkgconfig qt:6 tar:xz \
		xorg
USE_KDE=	archive auth codecs completion config configwidgets coreaddons \
		doctools i18n iconthemes itemviews jobwidgets kio service \
		solid sonnet textwidgets widgetsaddons windowsystem xmlgui \
		ecm:build
USE_QT=		base
USE_XORG=	x11

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
