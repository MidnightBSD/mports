PORTNAME=	mate-icon-theme
PORTVERSION=	1.28.0
CATEGORIES=	x11-themes mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of icons for the MATE desktop
WWW=		https://mate-desktop.org/

LICENSE=	lgpl3 CC-BY-SA-3.0
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme \
		icon-naming-utils>=0.8.7:x11-themes/icon-naming-utils
RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme

PORTSCOUT=	limitw:1,even

USES=		gettext-tools gmake gnome pkgconfig tar:xz
USE_GNOME=	intltool
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
