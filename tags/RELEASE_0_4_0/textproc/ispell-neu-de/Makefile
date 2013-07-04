# $MidnightBSD: mports/textproc/ispell-neu-de/Makefile,v 1.1 2008/06/14 04:03:16 laffer1 Exp $

PORTNAME=	ispell
CATEGORIES=	textproc german
PKGNAMESUFFIX=	-neu-20071211
PKGNAMEPREFIX=	de-

MAINTAINER=	ports@MidnightBSD.org
LICENSE=	unknown

ISPELL_DENEU=	yes
MASTERDIR=	${.CURDIR}/../../textproc/ispell
USE_PERL5=	yes

.if exists(${.CURDIR}/Makefile.local)
.include "${.CURDIR}/Makefile.local"
.endif

.include        "${MASTERDIR}/Makefile"
