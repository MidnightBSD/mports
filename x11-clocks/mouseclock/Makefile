PORTNAME=	mouseclock
PORTVERSION=	1.0
PORTREVISION=	5
CATEGORIES=	x11-clocks
MASTER_SITES=	SUNSITE/X11/clocks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display the current time using the X root cursor

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		imake:notall xorg
USE_XORG=	x11

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
