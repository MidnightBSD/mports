# Created by: Koop Mast <kwm@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/www/libsocialweb/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	libsocialweb
PORTVERSION=	0.25.21
CATEGORIES=	www gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Personal social data server.

BUILD_DEPENDS=	vapigen:${PORTSDIR}/lang/vala
LIB_DEPENDS=	librest-0.7.so:${PORTSDIR}/devel/librest \
		libgnome-keyring.so:${PORTSDIR}/security/libgnome-keyring \
		libjson-glib-1.0.so:${PORTSDIR}/devel/json-glib

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gconf2 glib20 intlhack introspection:build \
		libxslt:build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-vala-bindings
# review if we want all the services enabled, because of not completely
# safe public API security wise?
CONFIGURE_ARGS+=--enable-all-services 
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
