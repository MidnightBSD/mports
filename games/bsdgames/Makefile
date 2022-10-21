PORTNAME=	bsdgames
PORTVERSION=	0.75
DISTVERSIONPREFIX=	v
PORTEPOCH=	2
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Traditional BSD games taken mostly from DragonFly BSD

LICENSE=	bsd3

USES=		ncurses tar:xz uidfix

USE_GITHUB=	yes
GH_ACCOUNT=	pianojockl

MAKE_ARGS=	BINGRP=${BINGRP}
MAKE_ENV=	WITHOUT_WERROR=yes

CFLAGS+=	-fcommon

CONFLICTS=	hangman

INFO=		wump
INFO_PATH=	share/games

.include <bsd.port.pre.mk>

MAKE_ARGS+=	NO_WERROR=yes

pre-install:
.for d in atc larn quiz.db boggle
	@${MKDIR} ${PREFIX}/share/games/$d
.endfor
.for d in atc battlestar hackdir/save larn phantasia
	@${MKDIR} ${FAKE_DESTDIR}/var/games/$d
.endfor

post-install:
# avoid conflict with games/bs and shells/fish
.for prog in bs fish
	${MV} ${STAGEDIR}${PREFIX}/bin/${prog} ${STAGEDIR}${PREFIX}/bin/${prog}-game
	${MV} ${STAGEDIR}${MAN6PREFIX}/man/man6/${prog}.6.gz ${STAGEDIR}${MAN6PREFIX}/man/man6/${prog}-game.6.gz
.endfor

	@${TOUCH} ${FAKE_DESTDIR}/var/games/atc_score
	@${FIND} ${FAKE_DESTDIR}/var/games -type f -exec ${MV} {} {}.sample \;

.include <bsd.port.post.mk>
