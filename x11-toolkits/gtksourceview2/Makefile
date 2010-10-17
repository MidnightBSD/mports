# $MidnightBSD: mports/x11-toolkits/gtksourceview2/Makefile,v 1.6 2009/12/13 21:57:55 laffer1 Exp $

PORTNAME=	gtksourceview2
PORTVERSION=	2.10.4
PORTREVISION?=	0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/${PORTNAME:S/2$//}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A text widget that adds syntax highlighting to the GtkTextView widget
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
USE_GNOME=	gnomeprefix gnomehack gtk20 gconf2 libxml2 intlhack \
		ltverhack referencehack
CONFIGURE_ARGS=	--enable-compile-warnings=no --enable-glade-catalog=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>

.endif
