PORTNAME=	ohsnap
PORTVERSION=	1.8.0
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/osnapfont/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monospaced font based on Artwiz Snap

LICENSE=	gpl2

USES=		fonts
FONTS=		ohsnap ohsnapu
NO_BUILD=	yes

SUB_FILES=	pkg-message

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/* ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
