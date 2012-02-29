# $MidnightBSD: mports/games/cowsay/Makefile,v 1.3 2008/04/04 01:03:02 laffer1 Exp $
# $FreeBSD: ports/games/cowsay/Makefile,v 1.6 2004/12/09 03:01:44 kris Exp $

PORTNAME=	cowsay
PORTVERSION=	3.03
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	http://www.nog.net/~tony/warez/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configurable talking characters in ASCII art
LICENSE=	artistic

USE_PERL5=	yes

NO_BUILD=	# defined

MAN1=		cowsay.1
MLINKS=		cowsay.1 cowthink.1

do-install:
	cd ${WRKSRC}; ${SH} install.sh ${PREFIX}
	@${INSTALL_DATA} ${FILESDIR}/box.cow ${PREFIX}/share/cows
	@${INSTALL_DATA} ${FILESDIR}/jkh.cow ${PREFIX}/share/cows
	@${INSTALL_DATA} ${FILESDIR}/tux-stab.cow ${PREFIX}/share/cows

.include <bsd.port.mk>
