PORTNAME=	kwallet
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	sysutils kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Safe desktop-wide storage for passwords

LIB_DEPENDS=	libassuan.so:security/libassuan \
		libgcrypt.so:security/libgcrypt \
		libsecret-1.so:security/libsecret \
		libgpgme.so:security/gpgme \
		libgpgmepp.so:security/gpgme-cpp \
		libqca-qt6.so:devel/qca@qt6

USES=		cmake gettext-tools gl kde:6 pkgconfig qt:6 tar:xz xorg
USE_GL=		gl opengl
USE_KDE=	colorscheme config coreaddons crash dbusaddons i18n \
		notifications widgetsaddons windowsystem \
		ecm:build doctools:build
USE_QT=		base
USE_XORG=	x11

KDE_FRAMEWORKS_VERSION=	6.14.1
.include <bsd.port.mk>
