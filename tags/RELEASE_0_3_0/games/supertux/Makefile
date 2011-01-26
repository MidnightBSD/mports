# Makefile for:		supertux
# Date created:		22. May 2008
# Whom:			Stevan Tiefert
#
# $MidnightBSD: mports/games/supertux/Makefile,v 1.4 2010/01/02 18:49:36 laffer1 Exp $
#

PORTNAME=	supertux
PORTVERSION=	0.1.3
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_BERLIOS}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	A 2D jump 'n run like Super Mario Bros.
LICENSE=	gpl2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-debug
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1
USE_SDL=	sdl mixer image
USE_GL=		yes
USE_GMAKE=	yes

post-patch:
	@${REINPLACE_CMD} -e 's,Menu::,,' ${WRKSRC}/src/menu.h

.include <bsd.port.mk>
