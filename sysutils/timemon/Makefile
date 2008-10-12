# New ports collection makefile for:    timemon.app
# Date created:         28 Aug 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD: mports/sysutils/timemon/Makefile,v 1.3 2007/11/07 20:20:16 ctriv Exp $
# $FreeBSD: ports/sysutils/timemon/Makefile,v 1.1 2006/09/07 05:38:19 dinoex Exp $
#

PORTNAME=	timemon
PORTVERSION=	4.1
CATEGORIES=	sysutils gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
DISTNAME=	TimeMon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU time usage monitor for GNUstep
LICENSE=	unknown

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${RM} ${WRKSRC}/shared_obj/*.*

.include <bsd.port.mk>
