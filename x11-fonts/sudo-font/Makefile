PORTNAME=	sudo-font
DISTVERSIONPREFIX=	v
DISTVERSION=	0.42-1
DISTVERSIONSUFFIX=	-g1c100d7
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/jenskutilek/sudo-font/raw/${DISTVERSIONFULL}/dist/
DISTNAME=	sudo
DIST_SUBDIR=	${PORTNAME}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Font for programmers and command line users

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/OFL.txt

USES=		fonts zip

FONTNAME=	Sudo

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/Webfonts/*.woff* ${STAGEDIR}${FONTSDIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/FONTLOG.txt ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
