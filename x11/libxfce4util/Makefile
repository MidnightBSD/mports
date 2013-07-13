# New ports collection makefile for:	libxfce4util
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11/libxfce4util/Makefile,v 1.6 2012/03/03 01:52:53 laffer1 Exp $
# $FreeBSD: ports/x11/libxfce4util/Makefile,v 1.35 2008/06/06 14:09:04 edwin Exp $
#

PORTNAME=	libxfce4util
PORTVERSION=	4.10.1
CATEGORIES=	x11 xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/xfce/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 library with non-graphical helper functions
LICENSE=	lgpl

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 intltool intlhack
USE_PERL5=	yes
USE_LDCONFIG=	yes
USE_XFCE=	configenv
USES=		pathfix pkgconfig

OPTIONS_DEFINE=		NLS DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if ${PORT_OPTIONS:MDOCS}
CONFIGURE_ARGS+=--with-html-dir=${PREFIX}/share/gtk-doc/html
PLIST_SUB+=	APIDOCS=""
.else
CONFIGURE_ARGS+=--without-html-dir
PLIST_SUB+=	APIDOCS="@comment "
.endif

.include <bsd.port.mk>
