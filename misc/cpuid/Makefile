# ex:ts=8
# New ports collection makefile for:	cpuid
# Date created:			May 22, 2001
# Whom:				ijliao
#
# $MidnightBSD: mports/misc/cpuid/Makefile,v 1.2 2007/08/17 00:43:30 laffer1 Exp $
# $FreeBSD: ports/misc/cpuid/Makefile,v 1.14 2006/11/14 20:49:38 edwin Exp $
#

PORTNAME=	cpuid
PORTVERSION=	3.3
PORTREVISION=	4
CATEGORIES=	misc
MASTER_SITES=	http://www.ka9q.net/code/cpuid/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU identification utility
LICENSE=	gpl2

PLIST_FILES=	bin/cpuid
ONLY_FOR_ARCHS=	i386 amd64

post-patch:
	${MV} ${WRKSRC}/Makefile ${WRKSRC}/Makefile.bak && \
	    ${CP} ${FILESDIR}/Makefile.bsd ${WRKSRC}/Makefile

.include <bsd.port.mk>
