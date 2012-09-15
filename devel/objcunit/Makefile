# New ports collection makefile for:    objcunit
# Date created:         21 Jan 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/devel/objcunit/Makefile,v 1.1 2006/11/05 12:21:16 dinoex Exp $
# $MidnightBSD: mports/devel/objcunit/Makefile,v 1.6 2008/10/21 14:35:25 laffer1 Exp $
#

PORTNAME=	objcunit
PORTVERSION=	1.2
PORTREVISION=	3
CATEGORIES=	devel gnustep
MASTER_SITES=	http://xanthippe.dyndns.org/Zipper/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	ObjcUnit-${PORTVERSION}-GNUstep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ObjcUnit frammework for GNUstep
LICENSE=	unknown

USE_GNUSTEP=		yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/ObjcUnit-${PORTVERSION}/ObjcUnit
ADDITIONAL_INCLUDE_DIRS+=	-I${WRKSRC}
MAKE_ENV+=	ObjcUnit_CURRENT_VERSION_NAME=0

post-patch:
	@${LN} -s ${WRKSRC}/Classes ${WRKSRC}/ObjcUnit

.include <bsd.port.mk>
