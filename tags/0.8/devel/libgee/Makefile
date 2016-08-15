# $MidnightBSD$
# $FreeBSD: ports/devel/libgee/Makefile,v 1.5 2011/02/28 12:01:51 kwm Exp $

PORTNAME=	libgee
PORTVERSION=	0.18.0
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject collection library

LICENSE=	lgpl

BUILD_DEPENDS=	valac:${PORTSDIR}/lang/vala

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-introspection=yes
USES=		gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
