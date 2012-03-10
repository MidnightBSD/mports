# $MidnightBSD: mports/sysutils/timemon/Makefile,v 1.4 2008/10/12 19:43:46 laffer1 Exp $
# $FreeBSD: ports/sysutils/timemon/Makefile,v 1.1 2006/09/07 05:38:19 dinoex Exp $

PORTNAME=	timemon
PORTVERSION=	4.1
CATEGORIES=	sysutils gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
DISTNAME=	TimeMon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU time usage monitor for GNUstep
LICENSE=	restricted

NO_CDROM=	distribute without fee

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${RM} ${WRKSRC}/shared_obj/*.*

.include <bsd.port.mk>
