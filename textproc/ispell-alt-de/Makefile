# New ports collection makefile for:    dealt-ispell
# Date created:                         10 February 2000
# Whom:                                 Alexander Langer <alex@big.endian.de>
#
# $FreeBSD: ports/german/ispell-alt/Makefile,v 1.10 2005/10/12 21:27:23 linimon Exp $
# $MidnightBSD$
#

PORTNAME=	ispell
CATEGORIES=	textproc german
PKGNAMESUFFIX=	-alt-19991219
PKGNAMEPREFIX=	de-

MAINTAINER=	ports@MidnightBSD.org
LICENSE=	unknown
# probably gpl2, but i dont' see a license file

ISPELL_DEALT=	yes
MASTERDIR=	${.CURDIR}/../../textproc/ispell

.if exists(${.CURDIR}/Makefile.local)
.include "${.CURDIR}/Makefile.local"
.endif

.include        "${MASTERDIR}/Makefile"
