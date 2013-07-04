# $MidnightBSD: mports/x11-toolkits/gdl/Makefile,v 1.6 2010/08/14 03:04:03 laffer1 Exp $

PORTNAME=	gdl
PORTVERSION=	2.30.1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Components intended to be shared between GNOME development tools
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XORG=	x11
USE_GNOME=	gnomeprefix gnomehack gtk20
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
