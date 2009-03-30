# $MidnightBSD$

PORTNAME=	libglut
PORTVERSION=	${MESAVERSION}
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL utility toolkit
LICENSE=	agg
# mostly MIT with some SGI free stuff

USE_LDCONFIG=	yes
USE_GL=		glu
USE_XORG=	glproto x11 xext xxf86vm xdamage xfixes xi xmu dri2proto

FAKE_OPTS=	prefixhack

pre-patch:
	${CP} ${FILESDIR}/midnightbsd ${FILESDIR}/midnightbsd-dri \
		${FILESDIR}/midnightbsd-dri-amd64 \
		${FILESDIR}/midnightbsd-dri-x86 ${WRKSRC}/configs

pre-install:
	@${MKDIR} ${PREFIX}/include/GL

do-install:
	cd ${WRKSRC}/src/glut/glx; ${GMAKE} install
	${INSTALL} -C -o ${BINOWN} -g ${BINGRP} -m 444 \
		${WRKSRC}/include/GL/glutf90.h \
		${WRKSRC}/include/GL/glut.h \
		${PREFIX}/include/GL
	${INSTALL_SCRIPT} ${WRKSRC}/lib/libglut.so.3 \
		${PREFIX}/lib
	${LN} -s ${PREFIX}/lib/libglut.so.3 ${PREFIX}/lib/libglut.so
	${INSTALL_DATA} ${WRKSRC}/src/glut/glx/glut.pc \
		${PREFIX}/libdata/pkgconfig

.include "${.CURDIR}/../../graphics/libGL/bsd.mesalib.mk"
.include <bsd.port.mk>
