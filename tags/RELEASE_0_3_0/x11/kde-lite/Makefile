# New ports collection makefile for:	KDE release ports
# Date created:				Sun Nov  4 11:17:58 EST 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/x11/kde-lite/Makefile,v 1.1 2007/11/04 16:21:01 laffer1 Exp $
#

PKGNAMESUFFIX=	-lite

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The MidnightBSD "meta-port" for (a subset of) KDE
LICENSE=	agg
DESCR=		${PORTSDIR}/x11/kde-lite/pkg-descr

MASTERDIR=	${.CURDIR}/../../x11/kde3
.if defined(IS_INTERACTIVE)
CONFLICTS=	kde-[0-9]*
.endif

WITHOUT_KDEVELOP=	yes
WITHOUT_KDEEDU=		yes
WITHOUT_KDEGAMES=	yes
WITHOUT_KDESDK=		yes
WITHOUT_KDETOYS=	yes
WITHOUT_KDEWEBDEV=	yes
WITHOUT_KOFFICE=	yes

.include "${MASTERDIR}/Makefile"
