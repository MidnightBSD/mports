# $MidnightBSD: mports/sysutils/timemon/Makefile,v 1.5 2012/03/10 06:09:11 laffer1 Exp $

PORTNAME=	timemon
PORTVERSION=	4.1
PORTREVISION=	1
CATEGORIES=	sysutils gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
DISTNAME=	TimeMon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU time usage monitor for GNUstep
LICENSE=	restricted

NO_CDROM=	distribute without fee

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${RM} ${WRKSRC}/shared_obj/*.*

.include <bsd.port.mk>
