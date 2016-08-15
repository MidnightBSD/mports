# $MidnightBSD$
# $FreeBSD: ports/sysutils/gnome-system-monitor/Makefile,v 1.78 2007/05/29 02:31:24 mezz Exp $

PORTNAME=	gnome-system-monitor
PORTVERSION=	3.16.0
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 system monitor program

LICENSE=	gpl2

BUILD_DEPENDS=	gnome-icon-theme>=0:${PORTSDIR}/misc/gnome-icon-theme \
		itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libgtop-2.0.so:${PORTSDIR}/devel/libgtop
RUN_DEPENDS=	gnome-icon-theme>=0:${PORTSDIR}/misc/gnome-icon-theme

USES=		alias gettext gmake pathfix pkgconfig tar:xz
USE_GNOME=	gtkmm30 intlhack librsvg2 libwnck3
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.gnome-system-monitor.enums.xml \
		org.gnome.gnome-system-monitor.gschema.xml

.include <bsd.port.mk>
