PORTNAME=	ktextaddons
DISTVERSION=	1.5.4
PORTREVISION=	1
CATEGORIES=	devel kde
MASTER_SITES=	KDE/stable/${PORTNAME}/

PATCH_SITES=	https://invent.kde.org/libraries/ktextaddons/-/commit/
PATCHFILES=	fdbb082aaa0125d60fdf819c9cb95c40bdb98800.patch:-p1 # Fix build with Qt 6.9

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Various text handling addons
WWW=		https://invent.kde.org/libraries/ktextaddons/

LICENSE=	lgpl

LIB_DEPENDS=	libqt6keychain.so:security/qtkeychain@qt6

USES=		gettext cmake kde:6 qt:6 tar:xz xorg
USE_KDE=	archive auth codecs completion config configwidgets \
		coreaddons i18n jobwidgets kio service solid sonnet \
		syntaxhighlighting widgetsaddons windowsystem \
		ecm:build
USE_QT=		base speech
USE_XORG=	x11

PLIST_SUB+=	LIBVERSION=${PORTVERSION}

.include <bsd.port.mk>
