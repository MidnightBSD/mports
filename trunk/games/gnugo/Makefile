# $MidnightBSD$

PORTNAME=	gnugo
PORTVERSION=	3.8
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	gnugo

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The game of Go
LICENSE=	gpl3

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes

INFO=		gnugo
MAN6=		gnugo.6
PLIST_FILES=	bin/gnugo

post-extract:
	${RM} -f ${WRKSRC}/doc/gnugo.info*

.include <bsd.port.mk>
