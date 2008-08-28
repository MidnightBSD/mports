# New ports collection makefile for:   pash
# Date created:        30 December 2000
# Whom:                George Reid <greid@ukug.uk.freebsd.org>
#
# $MidnightBSD: mports/shells/pash/Makefile,v 1.1 2006/09/18 15:21:50 laffer1 Exp $
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

.include <bsd.port.mk>
