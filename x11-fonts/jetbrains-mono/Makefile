PORTNAME=	jetbrains-mono
PORTVERSION=	2.304
PORTEPOCH=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/JetBrains/JetBrainsMono/releases/download/v${PORTVERSION}/
DISTNAME=	JetBrainsMono-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free and open source typeface for developers
WWW=		https://www.jetbrains.com/lp/mono

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/OFL.txt

USES=		fonts zip

NO_ARCH=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	@${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/ttf/*.ttf ${FONTSDIR}
	${LS} ${STAGEDIR}${FONTSDIR}/*.ttf | ${SED} -e's,^${FAKE_DESTDIR},,' >> ${TMPPLIST}

.include <bsd.port.mk>
