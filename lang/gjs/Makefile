# Created by: Pawel Worach <pawel.worach@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/lang/gjs/Makefile 385016 2015-04-29 22:13:10Z truckman $

PORTNAME=	gjs
PORTVERSION=	1.42.0
CATEGORIES=	lang gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Javascript binding

LICENSE=	mpl gpl2 lgpl2.1 mit
LICENSE_COMB=	multi

LIB_DEPENDS=	libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib \
		libmozjs-24.so:${PORTSDIR}/lang/spidermonkey24

USES=		gettext gmake libtool pathfix pkgconfig \
		python:build tar:xz
USE_GNOME=	cairo glib20 gnomeprefix introspection:build \
		intlhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.mport.options.mk>

USES+=	compiler:c++11-lib

.include <bsd.port.mk>
