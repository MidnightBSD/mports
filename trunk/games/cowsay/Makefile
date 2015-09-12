# $MidnightBSD$
# $FreeBSD: ports/games/cowsay/Makefile,v 1.6 2004/12/09 03:01:44 kris Exp $

PORTNAME=	cowsay
PORTVERSION=	3.03
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://www.nog.net/~tony/warez/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configurable talking characters in ASCII art
LICENSE=	artistic

USE_PERL5=	yes

NO_BUILD=	# defined

do-install:
	cd ${WRKSRC}; ${SH} install.sh ${PREFIX}
	@${INSTALL_DATA} ${FILESDIR}/box.cow ${PREFIX}/share/cows
	@${INSTALL_DATA} ${FILESDIR}/jkh.cow ${PREFIX}/share/cows
	@${INSTALL_DATA} ${FILESDIR}/tux-stab.cow ${PREFIX}/share/cows

.include <bsd.port.mk>
