PORTNAME=	kontact
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	deskutils kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE Personal Information Manager
WWW=		https://www.kde.org/

LICENSE=	lgpl2.1

USES=		cmake compiler:c++11-lib gettext kde:6 qt:6 tar:xz xorg
USE_KDE=	auth codecs completion config configwidgets coreaddons crash \
		guiaddons i18n iconthemes itemmodels jobwidgets kcmutils kio \
		parts service solid sonnet textwidgets widgetsaddons \
		windowsystem xmlgui \
		ecm:build
# pim components
USE_KDE+=	akonadi grantleetheme kontactinterface libkdepim pimcommon \
		pimtextedit
USE_QT=		base webengine
USE_XORG=	x11
USE_LDCONFIG=	yes

DESCR=		${.CURDIR:H:H}/deskutils/kdepim/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
