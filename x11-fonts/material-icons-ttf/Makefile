PORTNAME=	material-icons
DISTVERSION=	5.0.1
CATEGORIES=	x11-fonts
PKGNAMESUFFIX=	-ttf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Material Design icon set from Google

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=	fonts

USE_GITHUB=	yes
GH_ACCOUNT=	jossef
GH_PROJECT=	material-design-icons-iconfont

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	${FONTSDIR}/MaterialIcons-Regular.ttf

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/dist/fonts/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
