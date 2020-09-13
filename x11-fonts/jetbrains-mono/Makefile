PORTNAME=	jetbrains-mono
PORTVERSION=	1.0.6
PORTEPOCH=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/JetBrains/JetBrainsMono/releases/download/v${PORTVERSION}/
DISTNAME=	JetBrainsMono-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free and open source typeface for developers

LICENSE=	apache2

USES=		fonts zip

WRKSRC=	${WRKDIR}/JetBrainsMono-${PORTVERSION}

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/ttf/*.ttf ${FAKE_DESTDIR}${FONTSDIR}
	${LS} ${FAKE_DESTDIR}${FONTSDIR}/*.ttf | ${SED} -e's,^${FAKE_DESTDIR},,' >> ${TMPPLIST}

.include <bsd.port.mk>
