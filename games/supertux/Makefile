# Makefile for:		supertux
# Date created:		22. May 2008
# Whom:			Stevan Tiefert

PORTNAME=	supertux
PORTVERSION=	0.1.3
PORTREVISION=	3
CATEGORIES=	games
MASTER_SITES=	https://github.com/SuperTux/downloads/raw/master/

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	Super Tux is a side-scroller similar to Super Mario Brothers

LICENSE=	gpl2

USES=		gl gmake sdl tar:bzip2
USE_SDL=	image mixer
USE_GL=		gl
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=		--disable-debug

PORTSCOUT=	limit:^0\.1

post-patch:
	@${REINPLACE_CMD} -e 's,Menu::,,' ${WRKSRC}/src/menu.h

.include <bsd.port.mk>
