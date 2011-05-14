# $MidnightBSD: mports/misc/cpuid/Makefile,v 1.3 2007/11/12 01:09:56 laffer1 Exp $
# $FreeBSD: ports/misc/cpuid/Makefile,v 1.14 2006/11/14 20:49:38 edwin Exp $

PORTNAME=	cpuid
PORTVERSION=	3.3
PORTREVISION=	5
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
