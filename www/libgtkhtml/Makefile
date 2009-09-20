# $MidnightBSD: mports/www/libgtkhtml/Makefile,v 1.3 2008/08/21 17:26:56 laffer1 Exp $

PORTNAME=	libgtkhtml
PORTVERSION=	2.11.1
PORTREVISION=	0
CATEGORIES=	www gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/2.11
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight HTML rendering/printing/editing engine
LICENSE=	lgpl

USE_BZIP2=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libxslt gnomevfs2 gail ltverhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=  libtool:22
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
