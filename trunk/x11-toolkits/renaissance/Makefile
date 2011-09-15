# New ports collection makefile for:    renaissance
#
# $MidnightBSD: mports/x11-toolkits/renaissance/Makefile,v 1.8 2008/06/14 16:58:26 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/renaissance/Makefile,v 1.1 2006/09/10 12:12:28 dinoex Exp $
#

PORTNAME=	renaissance
PORTVERSION=	0.9.0
PORTREVISION=	0
CATEGORIES=	x11-toolkits gnustep
MASTER_SITES=	http://www.gnustep.it/Renaissance/Download/
DISTNAME=	Renaissance-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep GUI Development Framework
LICENSE=	lgpl

WRKSRC=		${WRKDIR}/${DISTNAME}
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

post-patch:
	${ECHO_CMD} "GNUSTEP_INSTALLATION_DOMAIN=SYSTEM" \
		>>${WRKSRC}/Source/GNUmakefile


.include <bsd.port.mk>
