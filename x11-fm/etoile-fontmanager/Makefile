# $MidnightBSD: mports/x11-fm/etoile-fontmanager/Makefile,v 1.1 2010/01/21 01:28:24 laffer1 Exp $

PORTNAME=	fontmanager
PORTVERSION=	0.4.1
CATEGORIES=	x11-fm x11-fonts gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project application for managing fonts
LICENSE=	bsd3

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Services/User/FontManager

post-configure:
	${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/etoile.make

.include <bsd.port.mk>
