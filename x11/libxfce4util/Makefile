# New ports collection makefile for:	libxfce4util
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11/libxfce4util/Makefile,v 1.2 2009/03/11 20:31:21 ctriv Exp $
# $FreeBSD: ports/x11/libxfce4util/Makefile,v 1.35 2008/06/06 14:09:04 edwin Exp $
#

PORTNAME=	libxfce4util
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	x11 xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 library with non-graphical helper functions
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 gnomehack gnometarget pkgconfig
USE_LDCONFIG=	yes
USE_XFCE=	configenv
CONFIGURE_ARGS+=	CPPFLAGS=-I/usr/local/include

.if defined(WITH_GTKDOC)
BUILD_DEPENDS+=	gtkdocize:${PORTSDIR}/textproc/gtk-doc
CONFIGURE_ARGS+=--enable-gtk-doc
PLIST_SUB+=	GTK_DOC=""
.else
CONFIGURE_ARGS+=--disable-gtk-doc
PLIST_SUB+=	GTK_DOC="@comment "
.endif

.include <bsd.port.mk>
