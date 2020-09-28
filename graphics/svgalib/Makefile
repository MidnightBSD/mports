PORTNAME=	svgalib
PORTVERSION=	1.4.3
PORTREVISION=	10
CATEGORIES=	graphics devel
MASTER_SITES=	http://www.svgalib.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low level console graphics library

LICENSE=	publicdom

USES=	gmake uidfix dos2unix shebangfix
DOS2UNIX_FILES=	utils/gtf/gtf.h utils/gtf/scitech.h
SHEBANG_FILES=	utils/svgakeymap
USE_LDCONFIG=	yes

FAKE_OPTS=	trueprefix

ALL_TARGET=	shared static

.include <bsd.port.pre.mk>

.if ${ARCH} != "i386"
MAKE_ENV=	NO_ASM=y
.endif
MAKE_ENV+=	FREEBSD=yes __FREEBSD__=yes

post-patch: .SILENT
	${REINPLACE_CMD} -e 's/__FREEBSD__/__MidnightBSD__/g' \
		${WRKSRC}/utils/gtf/scitech.h
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
