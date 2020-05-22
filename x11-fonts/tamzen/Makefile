PORTNAME=	tamzen-font
DISTVERSIONPREFIX=	Tamzen-
DISTVERSION=	1.11.4
CATEGORIES=	x11-fonts
DISTFILES=	sunaku-tamzen-font-Tamzen-1.11.4_GH0.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monospaced bitmap font forked from Tamsyn

LICENSE=	TAMZEN
LICENSE_NAME=	Tamzen License
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		fonts

USE_GITHUB=	yes
GH_ACCOUNT=	sunaku

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${FILESDIR}/fonts.alias \
		${WRKSRC}/pcf/*.pcf ${STAGEDIR}${FONTSDIR}

do-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
