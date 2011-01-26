# $MidnightBSD: mports/www/libgtkhtml/Makefile,v 1.4 2009/09/20 00:20:46 laffer1 Exp $

PORTNAME=	libgtkhtml
PORTVERSION=	2.11.1
PORTREVISION=	1
CATEGORIES=	www gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight HTML rendering/printing/editing engine
LICENSE=	lgpl

USE_BZIP2=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libxslt gnomevfs2 ltverhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=  libtool:22
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
