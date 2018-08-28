# $MidnightBSD$

PORTNAME=	dbus-glib
PORTVERSION=	0.104
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	http://dbus.freedesktop.org/releases/dbus-glib/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib bindings for the D-BUS messaging system

LICENSE=	gpl2

LIB_DEPENDS=	libdbus-1.so:${PORTSDIR}/devel/dbus
RUN_DEPENDS+=	python2.7:${PORTSDIR}/lang/python27

GNU_CONFIGURE=	yes
USES=		cpe gettext gmake libtool pathfix pkgconfig
CPE_VENDOR=	freedesktop
USE_GNOME=	glib20
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-test-socket-dir=${WRKDIR} \
		--disable-gtk-doc \
		--program-prefix='' \
		--with-html-dir=${PREFIX}/share/doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION="1.0"

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}

.include <bsd.port.mk>
