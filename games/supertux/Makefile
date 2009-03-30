# Makefile for:		supertux
# Date created:		22. May 2008
# Whom:			Stevan Tiefert
#
# $MidnightBSD: mports/games/supertux/Makefile,v 1.1 2008/05/22 22:47:41 stevan Exp $
#

PORTNAME=	supertux
PORTVERSION=	0.1.3
CATEGORIES=	games
MASTER_SITES=	http://download.berlios.de/supertux/

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	A 2D jump 'n run like SuperMario Bros.
LICENSE=	gpl2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1
USE_SDL=	sdl mixer image
USE_GMAKE=	yes

.include <bsd.port.mk>
