# New ports collection makefile for:    stepulator.app
# Date created:         30 Aug 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD: mports/math/stepulator/Makefile,v 1.3 2007/10/25 22:03:07 laffer1 Exp $
# $FreeBSD: ports/math/stepulator/Makefile,v 1.1 2006/09/07 17:18:40 dinoex Exp $
#

PORTNAME=	stepulator
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	math
MASTER_SITES=	http://www.linuks.mine.nu/stepulator/ \
		${MASTER_SITE_GNUSTEP_CH}
DISTNAME=	${PORTNAME}-gs-${PORTVERSION}
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scientific calculator implementing RPN notation for GNUstep
LICENSE=	bsd2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=		${WRKDIR}/Stepulator-gs

.include <bsd.port.mk>
