PORTNAME=	victor-mono
DISTVERSIONPREFIX=	v
DISTVERSION=	1.3.1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/rubjo/victor-mono/raw/${DISTVERSIONFULL}/public/
PKGNAMESUFFIX=	-ttf
DISTNAME=	VictorMonoAll

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programming font with cursive italics and ligatures

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		fonts zip
FONTNAME=	VictorMono

NO_ARCH=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/TTF/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
