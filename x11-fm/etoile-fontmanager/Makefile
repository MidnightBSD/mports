# $MidnightBSD$

PORTNAME=	fontmanager
PORTVERSION=	0.4.1
PORTREVISION=	1
CATEGORIES=	x11-fm x11-fonts gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project application for managing fonts

LICENSE=	bsd3

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build
USE_GNUSTEP_INSTALL=	yes

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Services/User/FontManager

post-configure:
	${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/etoile.make

.include <bsd.port.mk>
