# $MidnightBSD$

PORTNAME=	gnugo
PORTVERSION=	3.8
CATEGORIES=	games
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The game of Go
LICENSE=	gpl3

GNU_CONFIGURE=	yes
USES=		gmake

INFO=		gnugo
PLIST_FILES=	bin/gnugo \
		man/man6/gnugo.6.gz

post-extract:
	${RM} -f ${WRKSRC}/doc/gnugo.info*

.include <bsd.port.mk>
