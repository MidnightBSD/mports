# $MidnightBSD: mports/net-im/telepathy-glib/Makefile,v 1.5 2013/03/09 21:52:53 laffer1 Exp $

PORTNAME=	telepathy-glib
PORTVERSION=	0.18.2
CATEGORIES=	net-im
MASTER_SITES=	http://telepathy.freedesktop.org/releases/${PORTNAME}/ \
		http://miwibox.org/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib utility library for the Telepathy framework

LICENSE=	lgpl

BUILD_DEPENDS=	xsltproc:${PORTSDIR}/textproc/libxslt \
		vala-vapigen>=0.14.0:${PORTSDIR}/lang/vala-vapigen \
		g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	dbus-glib-1:${PORTSDIR}/devel/dbus-glib
RUN_DEPENDS=	vapigen:${PORTSDIR}/lang/vala-vapigen

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 ltverhack gnomehier
USE_PYTHON_BUILD=	yes
MAKE_JOBS_UNSAFE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-vala-bindings

post-patch:
	@${REINPLACE_CMD} -e 's|\(^pkgconfigdir =\).*|\1 ${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/telepathy-glib/Makefile.in

.include <bsd.port.mk>
