PORTNAME=	libkdepim
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	deskutils kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE PIM Libraries
WWW=		https://community.kde.org/KDE_PIM/Akonadi

LICENSE=	lgpl2.1

BUILD_DEPENDS=	${LOCALBASE}/include/boost/range/algorithm.hpp:devel/boost-libs

USES=		cmake compiler:c++11-lib gettext kde:6 qt:6 tar:xz
USE_KDE=	auth codecs completion config configwidgets coreaddons i18n \
		iconthemes itemmodels itemviews jobwidgets kcmutils kio \
		service wallet widgetsaddons \
		ecm:build
# pim components
USE_KDE+=	akonadi akonadicontacts akonadisearch contacts ldap mime
USE_QT=		base

USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
