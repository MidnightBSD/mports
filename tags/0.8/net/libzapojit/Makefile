# Created by: Gustau Perez i Querol <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/net/libzapojit/Makefile 373636 2014-11-29 18:22:32Z tijl $

PORTNAME=	libzapojit
PORTVERSION=	0.0.3
CATEGORIES=	net devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib/GObject wrapper for the Skydrive and Hotmail API

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libgoa-1.0.so:${PORTSDIR}/net/gnome-online-accounts \
		libjson-glib-1.0.so:${PORTSDIR}/devel/json-glib \
		librest-0.7.so:${PORTSDIR}/devel/librest

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix intltool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
