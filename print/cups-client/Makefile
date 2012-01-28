# New ports collection makefile for:	cups-client
# Date created:		07.May 2009
# Whom:			dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/print/cups-client/Makefile,v 1.4 2011/08/25 14:53:02 dinoex Exp $

CATEGORIES=	print

MAINTAINER=	dinoex@FreeBSD.org

MASTERDIR?=	${.CURDIR}/../cups-base
 
CUPS_CLIENT=	yes

OPTIONS=	GNUTLS		"Build with GNUTLS instead of OpenSSL" off

.if exists(${.CURDIR}/Makefile.local)
.include "${.CURDIR}/Makefile.local"
.endif

.include "${MASTERDIR}/Makefile"
