PORTNAME=	icons-tango
PORTVERSION=	0.8.90
PORTREVISION=	3
CATEGORIES=	x11-themes
MASTER_SITES=	GENTOO
DISTNAME=	tango-icon-theme-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic set of icons for the most common usage

LICENSE=	other

BUILD_DEPENDS=	${LOCALBASE}/libexec/icon-name-mapping:x11-themes/icon-naming-utils \
		Magick-config:graphics/ImageMagick6

GNU_CONFIGURE=	yes
USE_GNOME=	intlhack
USES+=		gettext-tools gmake gnome pathfix pkgconfig
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
