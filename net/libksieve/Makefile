PORTNAME=	libksieve
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	net kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sieve libraries for KDEPim
WWW=		https://www.kde.org/

LICENSE=	lgpl2.1

BUILD_DEPENDS=	${LOCALBASE}/include/boost/range/algorithm.hpp:devel/boost-libs
LIB_DEPENDS=	libsasl2.so:security/cyrus-sasl2

USES=		cmake compiler:c++11-lib gettext kde:6 qt:6 tar:xz xorg
USE_KDE=	archive attica auth codecs completion config configwidgets \
		coreaddons i18n iconthemes jobwidgets kio newstuff service \
		solid sonnet syntaxhighlighting wallet widgetsaddons \
		windowsystem xmlgui \
		ecm:build
# pim components
USE_KDE+=	akonadi identitymanagement ktextaddons libkdepim \
		mailtransport mime pimcommon pimtextedit
USE_QT=		base
USE_XORG=	x11
USE_LDCONFIG=	yes

DESCR=		${.CURDIR:H:H}/deskutils/kdepim/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
