# $MidnightBSD: mports/shells/osh/Makefile,v 1.3 2009/12/28 20:24:04 laffer1 Exp $ 
# $FreeBSD: ports/shells/osh/Makefile,v 1.17 2006/08/07 07:58:26 miwi Exp $

PORTNAME=	osh
DISTVERSION=	20120102
CATEGORIES=	shells
MASTER_SITES=	http://v6shell.org/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the UNIX 6th Edition shell
LICENSE=	bsd4

FAKE_OPTS=	trueprefix
MAN1=		fd2.1 goto.1 if.1 osh.1 sh6.1 glob6.1

MAKE_ENV+=	DOCDIR=${DOCSDIR} \
		DESTEXPDIR=${EXAMPLESDIR} \
		MANDIR=${MANPREFIX}/man/man1

.include <bsd.port.mk>
