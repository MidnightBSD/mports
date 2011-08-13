# $MidnightBSD: mports/x11-toolkits/eel/Makefile,v 1.9 2011/02/02 21:38:57 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/eel/Makefile,v 1.33 2007/07/03 17:08:19 mezz Exp $
#   $MCom: ports/x11-toolkits/eel/Makefile,v 1.51 2007/03/12 15:59:00 ahze Exp $

PORTNAME=	eel
PORTVERSION=	2.26.0
PORTREVISION=	3
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generally useful classes and extensions to GNOME
LICENSE=	lgpl

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XORG=	xrender
GNOME_DESKTOP_VERSION=2
USE_GNOME=	gnomeprefix gnomehack gnomedesktop ltverhack intlhack
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-shared --enable-static
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

.include <bsd.port.mk>
