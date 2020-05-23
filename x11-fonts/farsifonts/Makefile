# Created by: Babak Farrokhi <babak@farrokhi.net>

PORTNAME=	farsifonts
PORTVERSION=	0.4
PORTREVISION=	4
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/farsi-fonts/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard set of Unicode Persian fonts

LICENSE=	other

USES=		fonts zip

NO_BUILD=	yes

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
