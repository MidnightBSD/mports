# New ports collection makefile for:    de-ispell
# Date created:                         10 February 2000
# Whom:                                 Alexander Langer <alex@big.endian.de>
#
# $FreeBSD: ports/german/ispell/Makefile,v 1.14 2005/10/01 06:08:59 linimon Exp $
# $MidnightBSD: mports/german/ispell/Makefile,v 1.2 2007/11/11 00:21:44 laffer1 Exp $
#

PORTNAME=	ispell
CATEGORIES=	textproc german
PKGNAMESUFFIX=	-20001109
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
