# Created by: Lowell Gilbert <lgfbsd@be-well.ilk.org>

PORTNAME=	isabella-ttf
PORTVERSION=	1.202
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.thibault.org/fonts/isabella/
DISTNAME=	Isabella-${PORTVERSION}-ttf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Font by John Stracke based on the Isabella Breviary

LICENSE=	OFL11 lgpl
LICENSE_COMB=	dual
LICENSE_FILE_OFL11=	${WRKSRC}/OFL.txt
LICENSE_FILE_lgpl=	${WRKSRC}/COPYING.LIB

USES=		fonts
NO_BUILD=	yes
NO_ARCH=	yes
WRKSRC=		${WRKDIR}/Isabella

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.txt ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
