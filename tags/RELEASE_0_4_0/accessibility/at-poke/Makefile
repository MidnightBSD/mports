# $MidnightBSD: mports/accessibility/at-poke/Makefile,v 1.6 2012/03/11 18:41:50 laffer1 Exp $

PORTNAME=	at-poke
PORTVERSION=	0.2.3
PORTREVISION=	4
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
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|glib/.*\.h>|glib.h>|g' ${WRKSRC}/src/eventlog.h

.include <bsd.port.mk>
