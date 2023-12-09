PORTNAME=	yahtzee
PORTVERSION=	1.0
CATEGORIES=	games
MASTER_SITES=	SUNSITE/games/strategy
DISTNAME=	${PORTNAME}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Curses version of the dice game for one or more players

USES=		ncurses tar:Z
WRKSRC=		${WRKDIR}/${PORTNAME}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/yahtzee ${PREFIX}/bin
	@${MKDIR} -m 0755 ${FAKE_DESTDIR}/var/games/yahtzee
	${TOUCH} ${FAKE_DESTDIR}/var/games/yahtzee/yahtzee.sco.sample

.include <bsd.port.mk>
