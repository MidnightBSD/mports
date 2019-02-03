# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/multimedia/libmediaart/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	libmediaart
PORTVERSION=	1.9.0
CATEGORIES=	multimedia devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for handling media art

LICENSE=	lgpl2.1

BUILD_DEPENDS=	gtkdoc-check:${PORTSDIR}/textproc/gtk-doc \
		vala>=0:${PORTSDIR}/lang/vala

USES=		gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gdkpixbuf2 glib20 introspection
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
CONFIGURE_ARGS+=--enable-gtk-doc \
		--enable-introspection \
		--enable-vala
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
