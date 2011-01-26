# New ports collection makefile for:	clive
# Date created:				15 March 2004
# Whom:					johans
#
# $MidnightBSD: mports/deskutils/ljclive/Makefile,v 1.4 2007/10/25 00:38:29 laffer1 Exp $
# $FreeBSD: ports/deskutils/ljclive/Makefile,v 1.6 2004/11/12 18:36:16 pav Exp $
#

PORTNAME=	ljclive
PORTVERSION=	0.4.5
PORTREVISION=	2
CATEGORIES=	deskutils
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/clive-${PORTVERSION}
DISTFILES=	clive-${PORTVERSION}.tar.gz		

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A command line client for posting LiveJournal entries
LICENSE=	bsd3

CONFLICTS=      py*-clive-[0-9]*

WRKSRC=		${WRKDIR}/clive-${PORTVERSION}

MAN1=	clive.1

GNU_CONFIGURE=	yes
USE_GETOPT_LONG=yes

.include <bsd.port.mk>
