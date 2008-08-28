# New ports collection makefile for:	gnustep-objc
# Date created:		28.Mar.2003
# Whom:			dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/lang/gcc-objc/Makefile,v 1.2 2008/04/14 04:14:24 laffer1 Exp $
# $FreeBSD: ports/lang/gcc-objc/Makefile,v 1.17 2006/04/06 13:31:42 dinoex Exp $
#

PORTEPOCH?=		3
CATEGORIES=		lang
PKGNAMESUFFIX=		-objc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Compiler Collection ${COMMENT2} with threads and shared libs
LICENSE=	gpl2

WITHOUT_JAVA=		yes

.if !defined(GNUSTEP_WITH_GCC34)
.if !defined(GNUSTEP_WITH_GCC41) && !defined(GNUSTEP_WITH_GCC42) && !defined(GNUSTEP_WITH_GCC43)
GNUSTEP_WITH_GCC41=	yes
.endif
.endif

.if defined(GNUSTEP_WITH_GCC41)
MASTERDIR?=		${.CURDIR}/../gcc41
CONFLICTS?=		gcc-4.1*
COMMENT2=		4.1.x
.endif
.if defined(GNUSTEP_WITH_GCC42)
MASTERDIR?=		${.CURDIR}/../gcc42
CONFLICTS?=		gcc-4.2*
COMMENT2=		4.2.x
.endif
.if defined(GNUSTEP_WITH_GCC43)
MASTERDIR?=             ${.CURDIR}/../gcc43
CONFLICTS?=             gcc-4.3*
COMMENT2=               4.3.x
.endif

.if exists(${.CURDIR}/Makefile.local)
.include "${.CURDIR}/Makefile.local"
.endif

.include "${MASTERDIR}/Makefile"
