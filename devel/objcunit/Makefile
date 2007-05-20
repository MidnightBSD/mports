# New ports collection makefile for:    objcunit
# Date created:         21 Jan 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/devel/objcunit/Makefile,v 1.1 2006/11/05 12:21:16 dinoex Exp $
# $MidnightBSD: mports/devel/objcunit/Makefile,v 1.2 2007/05/06 18:35:09 ctriv Exp $
#

PORTNAME=	objcunit
PORTVERSION=	1.2
CATEGORIES=	devel
MASTER_SITES=	http://xanthippe.dyndns.org/Zipper/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	ObjcUnit-${PORTVERSION}-GNUstep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ObjcUnit frammework for GNUstep

WRKSRC=		${WRKDIR}/ObjcUnit-${PORTVERSION}/ObjcUnit
USE_GNUSTEP=		yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes


post-patch:
	@${LN} -s ${WRKSRC}/Classes ${WRKSRC}/ObjcUnit

.include <bsd.port.mk>
