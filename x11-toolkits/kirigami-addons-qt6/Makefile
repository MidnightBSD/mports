PORTNAME=	kirigami-addons
DISTVERSION=	1.8.1
CATEGORIES=	x11-toolkits kde
MASTER_SITES=	KDE/stable/${PORTNAME}/
DIST_SUBDIR=	KDE
PKGNAMESUFFIX=	-qt6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional set of visual components for Kirigami framework
WWW=		https://invent.kde.org/libraries/kirigami-addons

LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers

USES=		cmake compiler:c++17-lang gettext gl kde:6 qt:6 tar:xz
USE_GL=		gl
USE_KDE=	config coreaddons globalaccel guiaddons i18n kirigami2 \
		ecm:build
USE_QT=		base declarative

PLIST_SUB=	SHLIB_VER=${PORTVERSION}

.include <bsd.port.mk>
