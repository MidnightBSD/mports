PORTNAME=	gnome-system-monitor
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME system monitor program
WWW=		https://apps.gnome.org/GnomeSystemMonitor/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	catch2>0:devel/catch2 \
		itstool:textproc/itstool
LIB_DEPENDS=	libgtop-2.0.so:devel/libgtop \
		libgraphene-1.0.so:graphics/graphene
RUN_DEPENDS=	polkit>0:sysutils/polkit

PORTSCOUT=	limitw:1,even

USES=		compiler:c++20-lang gettext gnome localbase meson \
		pkgconfig tar:xz
USE_CXXSTD=	c++20
USE_GNOME=	glib20 glibmm26 gtkmm40 libadwaita librsvg2 libxml2
MESON_ARGS=	-Dsystemd=false
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.gnome-system-monitor.enums.xml \
		org.gnome.gnome-system-monitor.gschema.xml

.include <bsd.port.mk>
