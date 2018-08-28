# Created by: Koop Mast <kwm@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-contacts/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-contacts
PORTVERSION=	3.16.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Contacts manager for gnome

LICENSE=	gpl2

BUILD_DEPENDS=	vala>=0.14.0:${PORTSDIR}/lang/vala
LIB_DEPENDS=	libgoa-1.0.so:${PORTSDIR}/net/gnome-online-accounts \
		libchamplain-0.12.so:${PORTSDIR}/graphics/libchamplain \
		libclutter-gtk-1.0.so:${PORTSDIR}/graphics/clutter-gtk3 \
		libgee-0.8.so:${PORTSDIR}/devel/libgee \
		libfolks.so:${PORTSDIR}/net-im/folks \
		libnotify.so:${PORTSDIR}/devel/libnotify

USE_GNOME=	evolutiondataserver3 gnomedesktop3 gtk30 intlhack \
		introspection:build
USES=		gettext gmake pathfix perl5 pkgconfig tar:xz
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_ENV=	XDG_CACHE_HOME=${WRKDIR}

GLIB_SCHEMAS=	org.gnome.Contacts.enums.xml \
		org.gnome.Contacts.gschema.xml

CHEESE_DESC=	Cheese webcam support

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	MANPAGES
OPTIONS_DEFAULT=MANPAGES

OPTIONS_DEFINE_i386=	CHEESE
OPTIONS_DEFAULT_i386=	CHEESE
OPTIONS_DEFINE_amd64=	CHEESE
OPTIONS_DEFAULT_amd64=	CHEESE

CHEESE_CONFIGURE_WITH=	cheese
CHEESE_LIB_DEPENDS=	libcheese-gtk.so:${PORTSDIR}/multimedia/cheese

MANPAGES_CONFIGURE_ENABLE=	man-pages
MANPAGES_USE=		GNOME=libxslt:build
MANPAGES_BUILD_DEPENDS=	docbook-xml>=0:${PORTSDIR}/textproc/docbook-xml \
			docbook-xsl>=0:${PORTSDIR}/textproc/docbook-xsl

.include <bsd.port.mk>
