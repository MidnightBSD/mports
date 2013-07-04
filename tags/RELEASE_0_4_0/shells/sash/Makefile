# $MidnightBSD: mports/shells/sash/Makefile,v 1.3 2009/12/28 20:39:20 laffer1 Exp $

PORTNAME=	sash
PORTVERSION=	3.7
CATEGORIES=	shells
MASTER_SITES=	http://members.tip.net.au/~dbell/programs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Stand-Alone shell combining many common utilities
LICENSE=	publicdom

MAN1=		sash.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/sash ${PREFIX}/bin/sash
	${INSTALL_MAN} ${WRKSRC}/sash.1 ${MAN1PREFIX}/man/man1/sash.1


.include <bsd.port.mk>
