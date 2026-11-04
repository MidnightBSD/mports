PORTNAME=	zatacka
PORTVERSION=	0.1.8
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}_src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nibbles-like multiplayer game
WWW=		https://zatacka.sourceforge.net/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/GPL

USES=		gmake sdl
GNU_CONFIGURE=	yes
USE_SDL=	sdl ttf image
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
CPPFLAGS+=	-I${LOCALBASE}/include

PLIST_FILES=	bin/${PORTNAME}
PORTDATA=	*

DESKTOP_ENTRIES="Zatacka" \
		"Nibbles-like multiplayer game" \
		"" \
		"zatacka" \
		"Game;ArcadeGame;" \
		false

post-patch:
	@${REINPLACE_CMD} -e 's|__linux__|__MidnightBSD__|; s|\[30\]|[PATH_MAX]|' \
		${WRKSRC}/src/main.cpp

.include <bsd.port.mk>
