# $MidnightBSD: mports/sysutils/upower/Makefile,v 1.3 2011/06/08 03:27:31 laffer1 Exp $
# $FreeBSD: ports/sysutils/upower/Makefile,v 1.4 2010/07/25 19:35:04 kwm Exp $

PORTNAME=	upower
PORTVERSION=	0.9.7
CATEGORIES=	sysutils
MASTER_SITES=	http://upower.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	D-Bus daemon for simplifying power management tasks
LICENSE=	gpl2

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	polkit-gobject-1.0:${PORTSDIR}/sysutils/polkit \
    		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
RUN_DEPENDS=	${LOCALBASE}/lib/girepository-1.0/GObject-2.0.typelib:${PORTSDIR}/devel/gobject-introspection

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack intlhack ltverhack glib20
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_PYTHON=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-backend=freebsd \
		--localstatedir=/var
CONFIGURE_ENV=	GTKDOC="false"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.if defined(NO_INSTALL_MANPAGES)
CONFIGURE_ARGS+=--disable-man-pages
.else
BUILD_DEPENDS+=	${LOCALBASE}/share/sgml/docbook/4.1/dtd/catalog:${PORTSDIR}/textproc/docbook-410 \
    		${LOCALBASE}/share/xml/docbook/4.1.2/docbookx.dtd:${PORTSDIR}/textproc/docbook-sk \
    		xsltproc:${PORTSDIR}/textproc/libxslt \
		${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:${PORTSDIR}/textproc/docbook-xsl
MAN1=		upower.1
MAN7=		UPower.7
MAN8=		upowerd.8
.endif

.include <bsd.port.mk>
