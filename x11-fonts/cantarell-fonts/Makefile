PORTNAME=	cantarell-fonts
PORTVERSION=	0.101
CATEGORIES=	x11-fonts gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cantarell, a Humanist sans-serif font family

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig

USES=		gettext-tools fonts meson tar:xz
FONTSDIR=	share/fonts/cantarell
NO_ARCH=	yes

.include <bsd.port.mk>
