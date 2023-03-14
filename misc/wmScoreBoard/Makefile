PORTNAME=	wmScoreBoard
PORTVERSION=	0.30
PORTREVISION=	3
CATEGORIES=	misc windowmaker
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	pat

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Window Maker dockapp that display game scores from excite

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/../COPYING

RUN_DEPENDS=	wget:ftp/wget

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}/src
USES=		gmake shebangfix xorg
USE_XORG=	xpm x11 xext
#SHEBANG_FILES=	GrabScores.excite

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmScoreBoard ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/GrabScores.excite ${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${DOCSDIR}
.for docs in BUGS CHANGES HINTS README
	@${INSTALL_DATA} ${WRKSRC}/../${docs} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
