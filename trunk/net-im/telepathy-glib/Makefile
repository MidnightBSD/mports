# $MidnightBSD: mports/net-im/telepathy-glib/Makefile,v 1.5 2013/03/09 21:52:53 laffer1 Exp $

PORTNAME=	telepathy-glib
PORTVERSION=	0.20.2
CATEGORIES=	net-im
MASTER_SITES=	http://telepathy.freedesktop.org/releases/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib utility library for the Telepathy framework

BUILD_DEPENDS=	vala-vapigen>=0.20.0:${PORTSDIR}/lang/vala-vapigen
LIB_DEPENDS=	dbus-glib-1:${PORTSDIR}/devel/dbus-glib
RUN_DEPENDS=	vapigen:${PORTSDIR}/lang/vala-vapigen

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USES=		gmake pathfix pkgconfig
USE_GNOME=	glib20 gnomehier introspection:build libxslt:build ltverhack
USE_PYTHON_BUILD=	yes
MAKE_JOBS_UNSAFE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-vala-bindings

.include <bsd.port.mk>
