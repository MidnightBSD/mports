# New ports collection makefile for:	gtksourceview
# Date created:				07 May 2003
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/gtksourceview2/Makefile,v 1.3 2008/06/13 14:55:35 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/gtksourceview2/Makefile,v 1.2 2007/12/12 04:32:18 mezz Exp $
#   $MCom: ports-stable/x11-toolkits/gtksourceview2/Makefile,v 1.1 2007/12/01 06:20:10 marcus Exp $
#

PORTNAME=	gtksourceview2
PORTVERSION=	2.2.1
PORTREVISION?=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME:S/2$//}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A text widget that adds syntax highlighting to the GtkTextView widget
LICENSE=        gpl2

.if !defined(REFERENCE_PORT)

USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
USE_GNOME=	gnomeprefix gnomehack gtk20 libxml2 intlhack \
		ltverhack referencehack
CONFIGURE_ARGS=	--enable-compile-warnings=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>

.endif
