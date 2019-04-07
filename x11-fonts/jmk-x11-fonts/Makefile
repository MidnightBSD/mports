PORTNAME=	jmk-x11-fonts
PORTVERSION=	3.0
PORTREVISION=	5
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.jmknoble.net/fonts/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jim Knoble's font package for X

LICENSE=	gpl2

BUILD_DEPENDS+=	bdftopcf:x11-fonts/bdftopcf \
		mkfontdir>=0:x11-fonts/mkfontdir \
		mkfontscale>=0:x11-fonts/mkfontscale \
		fc-cache:x11-fonts/fontconfig 
RUN_DEPENDS+=	fc-cache:x11-fonts/fontconfig

USES=		fonts imake

do-install:
	${MKDIR} ${FONTSDIR}
	@${INSTALL_DATA} ${WRKSRC}/*.pcf.gz ${FONTSDIR}

.include <bsd.port.mk>
