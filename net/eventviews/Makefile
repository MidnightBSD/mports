PORTNAME=	eventviews
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	net kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Event view libraries for KDEPim
WWW=		https://github.com/KDE/mailcommon

LICENSE=	lgpl2.1

BUILD_DEPENDS=	${LOCALBASE}/include/boost/range/algorithm.hpp:devel/boost-libs
LIB_DEPENDS=	libKGantt6.so:graphics/kdiagram-qt6

USES=		cmake compiler:c++11-lib gettext kde:6 qt:6 tar:xz
USE_KDE=	auth codecs completion config configwidgets coreaddons \
		guiaddons i18n iconthemes itemmodels service widgetsaddons \
		ecm:build
# pim components
USE_KDE+=	akonadi akonadicalendar akonadicontacts calendarcore \
		calendarsupport calendarutils contacts holidays \
		identitymanagement libkdepim mime pimtextedit
USE_QT=		base
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
