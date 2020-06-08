# Created by: Mateusz Piotrowski <0mp@FreeBSD.org>

PORTNAME=	manrope
PORTVERSION=	4.5
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern geometric sans-serif font

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/OFL.txt

USES=		fonts
FONTNAME=	Manrope
USE_GITHUB=	yes
GH_ACCOUNT=	sharanda
# Upstream does not tag releases.
GH_TAGNAME=	ec910ca75197359c1443e8e3a000cf99d76cb6d7

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/ttf/* ${FAKE_DESTDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/otf/* ${FAKE_DESTDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/web/* ${FAKE_DESTDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/variable/* ${FAKE_DESTDIR}${FONTSDIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
