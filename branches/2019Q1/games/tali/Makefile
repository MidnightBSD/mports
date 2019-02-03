# $MidnightBSD$

PORTNAME=	tali
PORTVERSION=	3.22.0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome tali

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome localbase pathfix pkgconfig tar:xz
USE_GNOME=	cairo gtk30 intlhack librsvg2 libxml2:build
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=${PREFIX}/share

GLIB_SCHEMAS=	org.gnome.tali.gschema.xml

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/games

.include <bsd.port.mk>
