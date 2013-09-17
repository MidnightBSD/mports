# $MidnightBSD$

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
