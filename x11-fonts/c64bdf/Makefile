# Created by: Marcin Cieslak <saper@SYSTEM.PL>

PORTNAME=	c64bdf
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://beej.us/c64bdf/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Commodore 64 X11 fonts

LICENSE=	other

NO_BUILD=	yes

USES=		fonts

FONTS=	c64 c64d
FILES=	${FONTS:S,$,.bdf,}
PLIST_FILES=	${FILES:S,^,${FONTSDIR}/,}

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${FILES} ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
