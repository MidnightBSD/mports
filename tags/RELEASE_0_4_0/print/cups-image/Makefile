# $MidnightBSD$
# $FreeBSD: ports/print/cups-image/Makefile,v 1.3 2011/08/27 09:02:10 dinoex Exp $

CATEGORIES=	print

MAINTAINER=	ports@MidnightBSD.org

MASTERDIR?=	${.CURDIR}/../cups-base
 
CUPS_IMAGE=	yes

OPTIONS=	GNUTLS		"Build with GNUTLS instead of OpenSSL" on

.if exists(${.CURDIR}/Makefile.local)
.include "${.CURDIR}/Makefile.local"
.endif

.include "${MASTERDIR}/Makefile"
