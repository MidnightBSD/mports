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
USE_GNOME=	glib20 intltool intlhack gtk20 gtksourceview2

GLIB_SCHEMAS=	org.xfce.mousepad.gschema.xml

.include <bsd.port.mk>
