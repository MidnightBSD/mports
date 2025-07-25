PORTNAME=	kget
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	net kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE download manager

BUILD_DEPENDS=	${LOCALBASE}/include/boost/concept_check.hpp:devel/boost-libs
LIB_DEPENDS=	libKTorrent6.so:net-p2p/libktorrent  \
		libassuan.so:security/libassuan \
		libgcrypt.so:security/libgcrypt \
		libgmp.so:math/gmp \
		libgpg-error.so:security/libgpg-error \
		libgpgme.so:security/gpgme \
		libgpgmepp.so:security/gpgme-cpp \
		libqca-qt6.so:devel/qca@qt6 \
		libqgpgmeqt6.so:security/gpgme-qt@qt6

USES=		cmake compiler:c++11-lang desktop-file-utils gettext kde:6 \
		qt:6 shebangfix sqlite tar:xz xorg
USE_KDE=	archive auth bookmarks codecs completion config configwidgets \
		coreaddons crash dbusaddons guiaddons i18n iconthemes \
		itemmodels itemviews jobwidgets kcmutils kio notifications \
		notifyconfig parts service solid sonnet statusnotifieritem \
		textwidgets unitconversion wallet widgetsaddons windowsystem \
		xmlgui \
		ecm:build
USE_QT=		base
USE_XORG=	x11
USE_LDCONFIG=	yes

MAKE_ENV=	XDG_CONFIG_HOME=/dev/null
CONFIGURE_ENV=	XDG_CONFIG_HOME=/dev/null

CONFLICTS_INSTALL=	sra-tools # bin/kget

OPTIONS_DEFINE=	DOCS WORKSPACE
OPTIONS_DEFAULT=	WORKSPACE

WORKSPACE_USE=	KDE=plasma-workspace
WORKSPACE_DESC=	Shutdown on completion support
WORKSPACE_CMAKE_BOOL_OFF=	CMAKE_DISABLE_FIND_PACKAGE_LibKWorkspace

.include <bsd.port.mk>
