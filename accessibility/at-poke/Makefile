# $MidnightBSD: mports/accessibility/at-poke/Makefile,v 1.3 2008/03/11 23:25:52 laffer1 Exp $

PORTNAME=	at-poke
PORTVERSION=	0.2.3
PORTREVISION=	2
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessibility testing and poking tool
LICENSE=	gpl2

USE_XORG=	x11
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix libglade2 libgailgnome
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
