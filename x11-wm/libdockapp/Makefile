

PORTNAME=	libdockapp
PORTVERSION=	0.7.2
CATEGORIES=	x11-wm
MASTER_SITES=	https://www.dockapps.net/download/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Standard library for Window Maker dock apps

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	mkfontdir:x11-fonts/mkfontscale

USES=		autoreconf fonts libtool pkgconfig xorg
USE_LDCONFIG=	yes
USE_XORG=	fontutil x11 xext xpm

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-font --without-examples

WRKSRC=		${WRKDIR}/dockapps-b9baa8f

OPTIONS_DEFINE=	EXAMPLES

post-install:
	@${MKDIR} ${FAKE_DESTDIR}${FONTSDIR}
.for file in *.pcf.gz
	${INSTALL_DATA} ${WRKSRC}/fonts/${file} ${FAKE_DESTDIR}${FONTSDIR}
.endfor
	@${MKDIR} ${EXAMPLESDIR}
.for file in README
	${INSTALL_DATA} ${WRKSRC}/examples/${file} ${EXAMPLESDIR}
.endfor
	@${MKDIR} ${EXAMPLESDIR}/basic
.for file in README *.c *.xpm
	${INSTALL_DATA} ${WRKSRC}/examples/basic/${file} ${EXAMPLESDIR}/basic
.endfor
	@${MKDIR} ${EXAMPLESDIR}/rectangles
.for file in *.c
	${INSTALL_DATA} ${WRKSRC}/examples/rectangles/${file} ${EXAMPLESDIR}/rectangles
.endfor

.include <bsd.port.mk>
