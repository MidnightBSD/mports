# Created by: Johannes Lundberg <johalun0@gmail.com>

PORTNAME=	meslo
DISTVERSION=	1.2.1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/andreberg/Meslo-Font/raw/master/dist/v${DISTVERSION}/
DISTNAME=	Meslo%20LG%20v${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Customized version of the Apple Menlo font

LICENSE=	Apache-2.0

USES=		fonts zip

NO_ARCH=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/Meslo\ LG\ v${DISTVERSION}

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
