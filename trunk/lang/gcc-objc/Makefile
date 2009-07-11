# $MidnightBSD: mports/lang/gcc-objc/Makefile,v 1.3 2008/05/09 17:43:03 laffer1 Exp $

PORTEPOCH?=		3
CATEGORIES=		lang
PKGNAMESUFFIX=		-objc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Compiler Collection ${COMMENT2} with threads and shared libs
LICENSE=	gpl2

WITHOUT_JAVA=		yes

.if !defined(GNUSTEP_WITH_GCC34)
.if !defined(GNUSTEP_WITH_GCC42) && !defined(GNUSTEP_WITH_GCC43)
GNUSTEP_WITH_GCC42=	yes
.endif
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
