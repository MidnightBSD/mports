# $MidnightBSD: mports/devel/dbus-glib/Makefile,v 1.10 2013/01/24 04:48:45 laffer1 Exp $

PORTNAME=	dbus-glib
PORTVERSION=	0.100.2
CATEGORIES=	devel gnome
MASTER_SITES=	http://dbus.freedesktop.org/releases/dbus-glib/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib bindings for the D-BUS messaging system
LICENSE=	gpl2

LIB_DEPENDS=	dbus-1:${PORTSDIR}/devel/dbus

USE_GNOME=	gnomehack glib20 ltverhack
USES=		gettext
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-test-socket-dir=${WRKDIR} \
		--disable-gtk-doc \
		--program-prefix='' \
		--with-html-dir=${PREFIX}/share/doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION="1.0"

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}

MAN1=		dbus-binding-tool.1

.include <bsd.port.mk>
