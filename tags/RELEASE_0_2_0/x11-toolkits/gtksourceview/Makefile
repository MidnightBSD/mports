# New ports collection makefile for:	gtksourceview
# Date created:				07 May 2003
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/gtksourceview/Makefile,v 1.2 2008/02/22 04:23:24 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/gtksourceview/Makefile,v 1.38 2007/05/19 20:31:05 flz Exp $
#   $MCom: ports/x11-toolkits/gtksourceview/Makefile,v 1.43 2006/10/02 00:40:29 ahze Exp $
#

PORTNAME=	gtksourceview
PORTVERSION=	1.8.5
PORTREVISION?=	3
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A text widget that adds syntax highlighting to the GtkTextView widget
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
USE_GNOME=	gnomeprefix gnomehack libgnome libgnomeprintui intlhack \
		ltverhack referencehack
CONFIGURE_ARGS=	--enable-compile-warnings=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lgnuregex"

.include <bsd.port.mk>

.endif
