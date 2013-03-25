# $MidnightBSD: mports/textproc/ispell-de/Makefile,v 1.1 2008/06/14 04:03:16 laffer1 Exp $

PORTNAME=	ispell
CATEGORIES=	textproc german
PKGNAMESUFFIX=	-20071211
PKGNAMEPREFIX=	de-

MAINTAINER=	ports@MidnightBSD.org
LICENSE=	gpl2

USE_PERL5=	yes

ISPELL_DEALT=	yes
ISPELL_DENEU=	yes
MASTERDIR=	${.CURDIR}/../../textproc/ispell

.if exists(${.CURDIR}/Makefile.local)
.include "${.CURDIR}/Makefile.local"
.endif

.include        "${MASTERDIR}/Makefile"
