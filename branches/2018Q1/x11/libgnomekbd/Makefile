# $MidnightBSD$
# $FreeBSD: ports/x11/libgnomekbd/Makefile,v 1.7 2007/05/28 23:22:29 mezz Exp $

PORTNAME=	libgnomekbd
PORTVERSION=	3.6.0
PORTREVISION=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME keyboard shared library
LICENSE=	lgpl

BUILD_DEPENDS=	libxklavier>=5.2:${PORTSDIR}/x11/libxklavier
LIB_DEPENDS=	libxklavier.so:${PORTSDIR}/x11/libxklavier

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix gtk30 intltool introspection:build \
		libxml2
GNU_CONFIGURE=	yes
USE_XORG=	ice
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.libgnomekbd.desktop.gschema.xml \
		org.gnome.libgnomekbd.gschema.xml \
		org.gnome.libgnomekbd.keyboard.gschema.xml

.include <bsd.port.mk>
