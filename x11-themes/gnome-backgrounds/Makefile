# $MidnightBSD$
# $FreeBSD: ports/x11-themes/gnome-backgrounds/Makefile,v 1.17 2007/10/24 23:37:12 marcus Exp $

PORTNAME=	gnome-backgrounds
PORTVERSION=	3.16.0
CATEGORIES=	x11-themes graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of backgrounds for GNOME

LICENSE=	gpl2

USES=		gettext gmake pathfix tar:xz
GNU_CONFIGURE=	yes
USE_GNOME=	gnomeprefix intlhack
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
