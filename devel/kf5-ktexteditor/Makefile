PORTNAME=	ktexteditor
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
PORTREVISION=	3
CATEGORIES=	devel kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KF5 advanced embeddable text editor

LIB_DEPENDS=	libgit2.so:devel/libgit2 \
		libeditorconfig.so:editors/editorconfig-core-c

USES=		cmake compiler:c++11-lib gettext kde:5 cpe pkgconfig \
		qt:5 tar:xz xorg
USE_KDE=	archive auth codecs completion config configwidgets \
		coreaddons guiaddons i18n itemviews \
		jobwidgets kio parts service solid sonnet syntaxhighlighting \
		textwidgets widgetsaddons windowsystem xmlgui \
		ecm:build
USE_QT=		concurrent core dbus declarative gui network printsupport \
		widgets xml \
		buildtools:build qmake:build
USE_XORG=	x11

.include <bsd.port.mk>
