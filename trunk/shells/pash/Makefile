# New ports collection makefile for:   pash
# Date created:        30 December 2000
# Whom:                George Reid <greid@ukug.uk.freebsd.org>
#
# $MidnightBSD$
# $FreeBSD: ports/shells/pash/Makefile,v 1.5 2003/11/03 07:28:44 linimon Exp $
#

PORTNAME=	pash
PORTVERSION=	2.2
CATEGORIES=	shells
MASTER_SITES=	http://www.chez-pierre.com/pash/Archives/
DISTNAME=	pash.sources

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-screen shell (commander GUI) for *nix.

NO_WRKSUBDIR=	yes

MAKEFILE=	makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/pash ${PREFIX}/bin/pash

post-install:
	@${ECHO} "updating /etc/shells"
	@${CP} /etc/shells /etc/shells.bak
	@(${GREP} -v ${PREFIX}/bin/osh /etc/shells.bak; \
	 ${ECHO_CMD} ${PREFIX}/bin/pash) > /etc/shells
	@${RM} /etc/shells.bak

.include <bsd.port.mk>
