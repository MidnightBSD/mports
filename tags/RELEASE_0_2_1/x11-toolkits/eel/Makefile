# New ports collection makefile for:    eel2
# Date created:         		8th May 2001
# Whom:                 		Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/eel/Makefile,v 1.4 2008/08/20 18:37:51 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/eel/Makefile,v 1.33 2007/07/03 17:08:19 mezz Exp $
#   $MCom: ports/x11-toolkits/eel/Makefile,v 1.51 2007/03/12 15:59:00 ahze Exp $
#

PORTNAME=	eel
PORTVERSION=	2.22.2
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
USE_GNOME=	gnomeprefix gnomehack gail gnomedesktop ltverhack intlhack
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-shared --enable-static
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

.include <bsd.port.mk>
