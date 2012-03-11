# $MidnightBSD: mports/graphics/glew/Makefile,v 1.1 2010/12/11 04:27:02 laffer1 Exp $
# $FreeBSD: ports/graphics/glew/Makefile,v 1.26 2010/08/03 11:29:34 mva Exp $

PORTNAME=	glew
PORTVERSION=	1.7.0
CATEGORIES=	graphics
MASTER_SITES=	SF
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The OpenGL Extension Wrangler Library
LICENSE=	bsd3

USE_XORG=	x11 xext xi xmu
USE_GMAKE=	yes
USE_GL=		yes
USE_LDCONFIG=	yes

post-patch:
	${CP} ${WRKSRC}/config/Makefile.freebsd ${WRKSRC}/config/Makefile.midnightbsd

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/glewinfo ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/visualinfo ${PREFIX}/bin

	${INSTALL_PROGRAM} ${WRKSRC}/lib/libGLEW.so.${PORTVERSION} \
		${PREFIX}/lib/libGLEW.so.1
	${INSTALL_PROGRAM} ${WRKSRC}/lib/libGLEWmx.so.${PORTVERSION} \
		${PREFIX}/lib/libGLEWmx.so.1
	${MKDIR} ${PREFIX}/include/GL
	${LN} -sf ${PREFIX}/lib/libGLEW.so.1 ${PREFIX}/lib/libGLEW.so
	${LN} -sf ${PREFIX}/lib/libGLEWmx.so.1 ${PREFIX}/lib/libGLEWmx.so
	${INSTALL_DATA} ${WRKSRC}/lib/libGLEW.a ${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/lib/libGLEWmx.a ${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/include/GL/*.h ${PREFIX}/include/GL
	${INSTALL_DATA} ${WRKSRC}/glew.pc ${PREFIX}/libdata/pkgconfig

.ifndef (NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in css html jpg png
	${INSTALL_DATA} ${WRKSRC}/doc/*.${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
