# $MidnightBSD$

PORTNAME=	moon-buggy
PORTVERSION=	1.0.51
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://seehuhn.de/media/programs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Drive a buggy across the moons surface

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--sharedstatedir=/var/games\
		--with-setgid=games

INFO=		moon-buggy

post-install:
	${CHMOD} 0555 ${PREFIX}/bin/moon-buggy

.include <bsd.port.mk>
