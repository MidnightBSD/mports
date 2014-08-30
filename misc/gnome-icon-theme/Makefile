# $MidnightBSD$

PORTNAME=	gnome-icon-theme
PORTVERSION=	3.6.2
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of icons for the GNOME desktop

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme \
		icon-naming-utils>=0.8.7:${PORTSDIR}/x11-themes/icon-naming-utils
RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

GNU_CONFIGURE=	yes
USES=		gmake pathfix pkgconfig tar:xz
USE_GNOME=	intlhack
INSTALLS_ICONS=	yes
CONFIGURE_ARGS=	--enable-icon-mapping
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
