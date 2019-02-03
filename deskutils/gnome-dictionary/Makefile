# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-dictionary/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-dictionary
PORTVERSION=	3.16.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 dictionary lookup application

LICENSE=	gpl2

BUILD_DEPENDS=	gtkdoc-check:${PORTSDIR}/textproc/gtk-doc \
		itstool:${PORTSDIR}/textproc/itstool

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	intlhack introspection:build gtk30
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.dictionary.gschema.xml

.include <bsd.port.mk>
