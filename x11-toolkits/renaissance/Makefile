# New ports collection makefile for:    renaissance
# Date created:         007 Sep 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD: mports/x11-toolkits/renaissance/Makefile,v 1.7 2008/06/14 16:56:57 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/renaissance/Makefile,v 1.1 2006/09/10 12:12:28 dinoex Exp $
#

PORTNAME=	renaissance
PORTVERSION=	0.8.0
PORTREVISION=	5
CATEGORIES=	x11-toolkits gnustep
MASTER_SITES=	http://www.gnustep.it/Renaissance/ \
		${MASTER_SITE_GNUSTEP_CH}
DISTNAME=	Renaissance-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep GUI Development Framework
LICENSE=	lgpl

WRKSRC=		${WRKDIR}/${DISTNAME}
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

post-patch:
	${ECHO_CMD} "GNUSTEP_INSTALLATION_DOMAIN=SYSTEM" \
		>>${WRKSRC}/Source/GNUmakefile


.include <bsd.port.mk>
