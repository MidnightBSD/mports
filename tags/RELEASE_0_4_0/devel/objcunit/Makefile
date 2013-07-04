# $MidnightBSD: mports/devel/objcunit/Makefile,v 1.9 2013/03/06 03:08:48 laffer1 Exp $

PORTNAME=	objcunit
PORTVERSION=	1.2
PORTREVISION=	4
CATEGORIES=	devel gnustep
MASTER_SITES=	http://xanthippe.dyndns.org/Zipper/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	ObjcUnit-${PORTVERSION}-GNUstep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ObjcUnit framework for GNUstep
LICENSE=	ibm

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
