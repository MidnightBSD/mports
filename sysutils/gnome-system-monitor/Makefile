# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>

PORTNAME=	gnome-system-monitor
PORTVERSION=	3.28.2
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 system monitor program

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libgtop-2.0.so:devel/libgtop

PORTSCOUT=	limitw:1,even

USES=		compiler:c++11-lang gettext gmake gnome localbase pathfix \
		pkgconfig tar:xz
USE_CXXSTD=	c++11
USE_GNOME=	gtkmm30 intlhack librsvg2 libxml2
USE_GNOME+=	glib20
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--disable-systemd

GLIB_SCHEMAS=	org.gnome.gnome-system-monitor.enums.xml \
		org.gnome.gnome-system-monitor.gschema.xml

.include <bsd.port.mk>
