# $MidnightBSD: mports/shells/pash/Makefile,v 1.2 2007/05/17 17:57:32 ctriv Exp $

PORTNAME=	pash
PORTVERSION=	2.2
CATEGORIES=	shells
MASTER_SITES=	http://www.chez-pierre.com/pash/Archives/
DISTNAME=	pash.sources

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-screen shell (commander GUI) for *nix.
LICENSE=	unknown

NO_WRKSUBDIR=	yes

MAKEFILE=	makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/pash ${PREFIX}/bin/pash

.include <bsd.port.mk>
