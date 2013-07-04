# $MidnightBSD: mports/x11-themes/gnome-backgrounds/Makefile,v 1.6 2011/05/28 06:20:57 laffer1 Exp $
# $FreeBSD: ports/x11-themes/gnome-backgrounds/Makefile,v 1.17 2007/10/24 23:37:12 marcus Exp $

PORTNAME=	gnome-backgrounds
PORTVERSION=	2.32.0
CATEGORIES=	x11-themes graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of backgrounds for GNOME 2
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
