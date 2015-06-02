# $MidnightBSD$

PORTNAME=	adwaita-icon-theme
PORTVERSION=	3.14.0
CATEGORIES=	x11-themes gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Symbolic Icons

LICENSE=	lgpl3

INSTALLS_ICONS=	yes
USES=		gettext-tools gmake pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix intltool gtk-update-icon-cache
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_path_GTK_ENCODE_SYMBOLIC_SVG="false"

post-install:
	@${RM} -rf ${STAGEDIR}${PREFIX}/lib/locale

.include <bsd.port.mk>
