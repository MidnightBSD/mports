PORTNAME=	3270font
DISTVERSIONPREFIX=	v
DISTVERSION=	2.3.1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/rbanffy/${PORTNAME}/releases/download/${DISTVERSIONFULL}/
DISTNAME=	3270_fonts_3b8f2fb

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IBM 3270 font for the nostalgic
WWW=		https://github.com/rbanffy/3270font

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		fonts zip

FONTNAME=	3270

NO_ARCH=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	@${MKDIR} ${FONTSDIR}
	(cd ${WRKSRC} && \
	${COPYTREE_SHARE} . ${FONTSDIR} "! -name LICENSE.txt")

.include <bsd.port.mk>
