PORTNAME=	amigafonts
PORTVERSION=	1.02
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Faithfully remade Amiga fonts
WWW=		https://github.com/rewtnull/amigafonts

LICENSE=	gpl3+

USES=		fonts
USE_GITHUB=	yes
GH_ACCOUNT=	rewtnull
NO_ARCH=	yes
NO_BUILD=	yes

post-patch:
	@cd ${WRKSRC}/ttf && for i in `ls *.ttf`; do ${MV} $$i `echo $$i | \
		${SED} -e 's/_v1.0//;s/_/-/'`; done

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/ttf/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
