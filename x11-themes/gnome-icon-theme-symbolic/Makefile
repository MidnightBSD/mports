# $MidnightBSD$

PORTNAME=	gnome-icon-theme-symbolic
PORTVERSION=	3.12.0
CATEGORIES=	x11-themes gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Symbolic Icons

LICENSE=	ccasa3

BUILD_DEPENDS=	icon-naming-utils>=0.8.7:x11-themes/icon-naming-utils

INSTALLS_ICONS=	yes
USES=		gmake pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_path_GIT="" \
		ac_cv_path_INKSCAPE=""
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|(GTK_UPDATE_ICON_CACHE) -q |(GTK_UPDATE_ICON_CACHE) -q -t -f |'g \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
