# Makefile for:		supertux
# Date created:		22. May 2008
# Whom:			Stevan Tiefert
#
# $MidnightBSD$
#

PORTNAME=	supertux
PORTVERSION=	0.1.3
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	Super Tux is a side-scroller similar to Super Mario Brothers

LICENSE=	gpl2

USES=		gmake tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-debug
USE_SDL=	mixer image
USE_GL=		gl

post-patch:
	@${REINPLACE_CMD} -e 's,Menu::,,' ${WRKSRC}/src/menu.h

.include <bsd.port.mk>
