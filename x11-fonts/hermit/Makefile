PORTNAME=	hermit
DISTVERSION=	2.0
CATEGORIES=	x11-fonts
MASTER_SITES=	https://pcaro.es/d/
PKGNAMESUFFIX=	-font
DISTNAME=	otf-hermit-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monospaced font for programmers by a programmer
WWW=		https://pcaro.es/p/hermit/

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		fonts

NO_ARCH=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.otf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
