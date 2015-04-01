# $MidnightBSD$

PORTNAME=	sash
PORTVERSION=	3.8
PORTREVISION=	1
CATEGORIES=	shells
MASTER_SITES=	http://members.tip.net.au/~dbell/programs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stand-Alone shell combining many common utilities

LICENSE=	publicdom

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/sash ${PREFIX}/bin/sash
	${INSTALL_MAN} ${WRKSRC}/sash.1 ${MAN1PREFIX}/man/man1/sash.1


.include <bsd.port.mk>
