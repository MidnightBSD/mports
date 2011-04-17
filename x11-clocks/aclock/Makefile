# $MidnightBSD: mports/x11-clocks/aclock/Makefile,v 1.1 2010/01/21 01:30:13 laffer1 Exp $

PORTNAME=	aclock
PORTVERSION=	0.3
CATEGORIES=	x11-clocks gnustep
MASTER_SITES=	http://gnu.ethz.ch/linuks.mine.nu/aclock/ \
		${MASTER_SITE_GNUSTEP_CH}
DISTNAME=	aclock-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Analog Clock for GNUstep
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}

.include <bsd.port.mk>
