PORTNAME=	cantarell-fonts
DISTVERSION=	0.311
CATEGORIES=	x11-fonts gnome
MASTER_SITES=	https://cantarell.gnome.org/releases/
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cantarell, a Humanist sans-serif font family
WWW=		https://cantarell.gnome.org/

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	appstream-util:devel/appstream-glib
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig

USES=		gettext-tools fonts meson tar:xz
FONTSDIR=	share/fonts/cantarell
NO_ARCH=	yes

.include <bsd.port.mk>
