# $MidnightBSD$

PORTNAME=	svgalib
PORTVERSION=	1.4.3
PORTREVISION=	8
CATEGORIES=	graphics devel
MASTER_SITES=	http://www.svgalib.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low level console graphics library

LICENSE=	publicdom

ONLY_FOR_ARCHS=	i386 amd64

#USE_DOS2UNIX=  utils/gtf/gtf.h utils/gtf/scitech.h
USES=	gmake uidfix shebangfix
SHEBANG_FILES=	utils/svgakeymap
USE_LDCONFIG=	yes

ALL_TARGET=	shared static

.include <bsd.port.pre.mk>

.if ${ARCH} != "i386"
MAKE_ENV=	NO_ASM=y
.endif

post-patch: .SILENT
	${MKDIR} ${WRKSRC}/include/linux
# Fix for GCC 4.1
	${REINPLACE_CMD} -e '30d' ${WRKSRC}/src/vgabg.h
	${REINPLACE_CMD} -e 's,^   (unsigned [[:alpha:]]*),,' \
		${WRKSRC}/src/apm.c
# 024_vesa_not_print_crap.patch from Debian
	${REINPLACE_CMD} -e '/^printf/d' ${WRKSRC}/src/vesa.c
# Clean up after typo fixes in manpages
	${FIND} ${WRKSRC}/doc -type f -name '*.[57].orig' -delete

post-install:
	@${MKDIR} ${PREFIX}/include/linux
	cd ${WRKSRC}/include/linux && \
		${INSTALL_DATA} keyboard.h kd.h ${PREFIX}/include/linux

.include <bsd.port.post.mk>
