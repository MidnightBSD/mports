# New ports collection makefile for:    deneu-ispell
# Date created:                         10 February 2000
# Whom:                                 Alexander Langer <alex@big.endian.de>
#
# $FreeBSD: ports/german/ispell-neu/Makefile,v 1.12 2005/10/01 06:09:00 linimon Exp $
# $MidnightBSD: mports/german/ispell-neu/Makefile,v 1.2 2007/11/11 00:24:40 laffer1 Exp $
#

PORTNAME=	ispell
CATEGORIES=	textproc german
PKGNAMESUFFIX=	-neu-20001109
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
