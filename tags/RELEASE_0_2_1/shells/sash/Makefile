# New ports collection makefile for:	sash
# Date created:		Jan 22, 2000
# Whom:			Patrick Gardella <patrick@freebsd.org>
#
# $MidnightBSD: mports/shells/sash/Makefile,v 1.1 2006/09/18 15:58:46 laffer1 Exp $
# $FreeBSD: ports/shells/sash/Makefile,v 1.11 2005/11/25 22:29:22 pav Exp $
#

PORTNAME=	sash
PORTVERSION=	3.7
CATEGORIES=	shells
MASTER_SITES=	http://www.canb.auug.org.au/%SUBDIR%/
MASTER_SITE_SUBDIR=	~dbell/programs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Stand-Alone shell combining many common utilities

MAN1=		sash.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/sash ${PREFIX}/bin/sash
	${INSTALL_MAN} ${WRKSRC}/sash.1 ${MAN1PREFIX}/man/man1/sash.1


.include <bsd.port.mk>
