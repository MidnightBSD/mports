# $MidnightBSD: mports/x11/libxfce4menu/Makefile,v 1.1 2011/02/09 14:36:04 laffer1 Exp $
# $FreeBSD: ports/x11/libxfce4menu/Makefile,v 1.8 2010/05/31 15:34:46 oliver Exp $

PORTNAME=	libxfce4menu
PORTVERSION=	4.6.2
CATEGORIES=	x11 xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 library for a freedesktop.org compliant menu implementation
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 gnomehack  gtk20 intltool intlhack pkgconfig
USE_LDCONFIG=	yes
USE_XFCE=	configenv libutil

CONFIGURE_ARGS=	--enable-gtk-doc-html=no \
		--disable-debug

OPTIONS=	GTKDOC	"install the library documentation"	off \
		NLS	"Enable Native Language Support"	on

.include <bsd.port.pre.mk>

.if defined(WITH_GTKDOC)
BUILD_DEPENDS+=	gtkdocize:${PORTSDIR}/textproc/gtk-doc
CONFIGURE_ARGS+=--enable-gtk-doc
PLIST_SUB+=	GTK_DOC=""
.else
CONFIGURE_ARGS+=--disable-gtk-doc
PLIST_SUB+=	GTK_DOC="@comment "
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.post.mk>
