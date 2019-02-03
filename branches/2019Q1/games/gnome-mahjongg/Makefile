# $MidnightBSD$

PORTNAME=	gnome-mahjongg
PORTVERSION=	3.22.0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome mahjongg

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	vala:lang/vala \
		itstool:textproc/itstool

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome localbase pathfix pkgconfig tar:xz
INSTALLS_ICONS=	yes
USE_GNOME=	cairo gtk30 intlhack librsvg2 libxml2:build
GNU_CONFIGURE=	yes

GLIB_SCHEMAS=	org.gnome.mahjongg.gschema.xml

.include <bsd.port.mk>
