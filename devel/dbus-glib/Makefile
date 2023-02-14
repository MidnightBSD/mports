PORTNAME=	dbus-glib
PORTVERSION=	0.112
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	http://dbus.freedesktop.org/releases/dbus-glib/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib bindings for the D-BUS messaging system
WWW=		https://www.freedesktop.org/wiki/Software/DBusBindings/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libexpat.so:textproc/expat2

GNU_CONFIGURE=	yes
USES=		cpe gettext gmake gnome libtool localbase pathfix pkgconfig
CPE_VENDOR=	freedesktop
USE_GNOME=	glib20
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-test-socket-dir=${WRKDIR} \
		--disable-gtk-doc \
		--program-prefix='' \
		--with-html-dir=${PREFIX}/share/doc
INSTALL_TARGET=	install-strip

PLIST_SUB=	VERSION="1.0"

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
