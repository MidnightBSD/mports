PORTNAME=	akonadi-contacts
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	net kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries and daemons to implement Contact Management in Akonadi
WWW=		https://www.kde.org/
LICENSE=	lgpl2.1

LIB_DEPENDS=	libassuan.so:security/libassuan \
		libgpg-error.so:security/libgpg-error \
		libgpgme.so:security/gpgme \
		libgpgmepp.so:security/gpgme-cpp \
		libqgpgmeqt6.so:security/gpgme-qt@qt6

USES=		cmake compiler:c++11-lib gettext kde:6 qt:6 tar:xz xorg
USE_KDE=	auth codecs completion config configwidgets coreaddons \
		dbusaddons i18n iconthemes itemmodels jobwidgets kcmutils kio \
		prison service solid sonnet textwidgets widgetsaddons \
		windowsystem xmlgui \
		ecm:build
# pim components
USE_KDE+=	akonadi akonadimime calendarcore contacts grantleetheme \
		libkleo mime
USE_QT=		base
USE_XORG=	x11
USE_LDCONFIG=	yes

DESCR=		${.CURDIR:H:H}/deskutils/kdepim/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
