# $MidnightBSD: mports/shells/sash/Makefile,v 1.2 2007/05/17 18:28:31 ctriv Exp $

PORTNAME=	sash
PORTVERSION=	3.7
CATEGORIES=	shells
MASTER_SITES=	http://www.canb.auug.org.au/%SUBDIR%/
MASTER_SITE_SUBDIR=	~dbell/programs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Stand-Alone shell combining many common utilities
LICENSE=	publicdom

MAN1=		sash.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/sash ${PREFIX}/bin/sash
	${INSTALL_MAN} ${WRKSRC}/sash.1 ${MAN1PREFIX}/man/man1/sash.1


.include <bsd.port.mk>
