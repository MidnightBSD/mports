# $MidnightBSD$
# $FreeBSD: ports/editors/mousepad/Makefile,v 1.9 2008/06/06 13:25:52 edwin Exp $

PORTNAME=	mousepad
PORTVERSION=	0.4.0
PORTREVISION=	2
CATEGORIES=	editors xfce
MASTER_SITES=	XFCE/src/apps/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple text editor for the Xfce Desktop

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib

GNU_CONFIGURE=	yes
USES=	desktop-file-utils gettext gmake libtool pkgconfig perl5 tar:bzip2
USE_GNOME=	glib20 intltool intlhack

OPTIONS_DEFINE=	GTK3
OPTIONS_DEFAULT=
GTK3_CONFIGURE_ENABLE=	gtk3
GTK3_USE=	gnome=gtk30,gtksourceview3
GTK3_USE_OFF=	gnome=gtk20,gtksourceview2

GLIB_SCHEMAS=	org.xfce.mousepad.gschema.xml

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGTK3} 
USE_GNOME+=gtk30,gtksourceview3
CONFIGURE_ARGS+= --enable-gtk3
LIB_DEPENDS+=      libgtk-3.so:${PORTSDIR}/x11-toolkits/gtk30
.else
USE_GNOME+=gtk20,gtksourceview2
LIB_DEPENDS+=      libgtk-x11-2.0.so:${PORTSDIR}/x11-toolkits/gtk20
.endif

.include <bsd.port.mk>
