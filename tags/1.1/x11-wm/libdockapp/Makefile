# $MidnightBSD$

PORTNAME=	libdockapp
PORTVERSION=	0.6.2
PORTREVISION=	2
CATEGORIES=	x11-wm
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	xride

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Standard library for Window Maker dock apps

LICENSE=	mit

OPTIONS_DEFINE=	EXAMPLES
OPTIONS_SUB=	yes

USES=		libtool tar:bzip2
USE_LDCONFIG=	yes
USE_XORG=	xext xpm
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-font --without-examples

post-install:
	@${MKDIR} ${PREFIX}/lib/X11/fonts/dockapp
.for file in fonts.alias fonts.dir *.pcf.gz
	${INSTALL_DATA} ${WRKSRC}/fonts/${file} ${PREFIX}/lib/X11/fonts/dockapp
.endfor
	@${MKDIR} ${EXAMPLESDIR}
.for file in README
	${INSTALL_DATA} ${WRKSRC}/examples/${file} ${EXAMPLESDIR}
.endfor
	@${MKDIR} ${EXAMPLESDIR}/basic
.for file in Imakefile README *.c *.xpm
	${INSTALL_DATA} ${WRKSRC}/examples/basic/${file} ${EXAMPLESDIR}/basic
.endfor
	@${MKDIR} ${EXAMPLESDIR}/rectangles
.for file in Imakefile *.c
	${INSTALL_DATA} ${WRKSRC}/examples/rectangles/${file} ${EXAMPLESDIR}/rectangles
.endfor

.include <bsd.port.mk>
