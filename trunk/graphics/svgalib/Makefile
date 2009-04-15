# $MidnightBSD: mports/graphics/svgalib/Makefile,v 1.1 2006/10/03 23:01:05 laffer1 Exp $

PORTNAME=	svgalib
PORTVERSION=	1.4.3
PORTREVISION=	6
CATEGORIES=	graphics devel
MASTER_SITES=	http://www.svgalib.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A low level console graphics library
LICENSE=	publicdom

USE_GMAKE=	yes
USE_LDCONFIG=	yes
MANCOMPRESSED=	yes

ALL_TARGET=	shared static

ONLY_FOR_ARCHS=	i386

.include <bsd.port.pre.mk>

.for i in 1 2 3 4 5 6 7 8 9
.if exists(${FILESDIR}/man${i})
MAN${i}!=	${CAT} ${FILESDIR}/man${i}
.endif
.endfor

pre-patch:
	for file in ${WRKSRC}/utils/gtf/*.h; do \
		${TR} -d '\015' < $${file} > $${file}.new; \
		${MV} $${file}.new $${file}; \
	done
	${MKDIR} ${WRKSRC}/include/linux
# Fix for GCC 4.1
	${REINPLACE_CMD} '30d' ${WRKSRC}/src/vgabg.h
	${REINPLACE_CMD} -e 's,^   (unsigned [[:alpha:]]*),,' \
		${WRKSRC}/src/apm.c

post-install:
	${MKDIR} ${PREFIX}/include/linux
	cd ${WRKSRC}/include/linux && \
		${INSTALL_DATA} keyboard.h kd.h ${PREFIX}/include/linux

.include <bsd.port.post.mk>
