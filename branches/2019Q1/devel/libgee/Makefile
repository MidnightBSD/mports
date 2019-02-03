# $MidnightBSD$
# $FreeBSD: ports/devel/libgee/Makefile,v 1.5 2011/02/28 12:01:51 kwm Exp $

PORTNAME=	libgee
PORTVERSION=	0.20.1
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject collection library

LICENSE=	lgpl2.1

BUILD_DEPENDS=	valac:lang/vala

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-introspection=yes
USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
