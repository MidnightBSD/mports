# $MidnightBSD: mports/x11-toolkits/renaissance/Makefile,v 1.9 2011/09/15 03:01:56 laffer1 Exp $

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
