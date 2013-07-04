# $MidnightBSD: mports/sysutils/garcon/Makefile,v 1.4 2013/02/24 00:58:31 laffer1 Exp $

PORTNAME=	garcon
PORTVERSION=	0.2.1
CATEGORIES=	sysutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xfce 4 essential utilities and scripts
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 intltool intlhack
USE_XFCE=	configenv libutil
USE_PKGCONFIG=	build
USE_PATHFIX=	yes

CONFIGURE_ARGS+=--disable-gtk-doc-html

OPTIONS_DEFINE=	DOCS NLS

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITHOUT_DOCS)
CONFIGURE_ARGS+=--without-html-dir
PLIST_SUB+=	APIDOCS="@comment "
.else
CONFIGURE_ARGS+=--with-html-dir=${PREFIX}/share/gtk-doc/html
PLIST_SUB+=	APIDOCS=""
.endif

.include <bsd.port.mk>
