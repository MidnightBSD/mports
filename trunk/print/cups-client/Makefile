# $MidnightBSD$
# $FreeBSD: ports/print/cups-client/Makefile,v 1.4 2011/08/25 14:53:02 dinoex Exp $

CATEGORIES=	print

MAINTAINER=	ports@MidnightBSD.org

LICENSE=	gpl2

MASTERDIR?=	${.CURDIR}/../cups-base
 
CUPS_CLIENT=	yes

.if exists(${.CURDIR}/Makefile.local)
.include "${.CURDIR}/Makefile.local"
.endif

.include "${MASTERDIR}/Makefile"
