PORTNAME=	uulib
PORTVERSION=	0.5.20
PORTREVISION=	3
CATEGORIES=	converters
MASTER_SITES=	http://www.fpx.de/fp/Software/UUDeview/download/
DISTNAME=	uudeview-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for uu/xx/Base64/BinHex/yEnc de-/encoding
WWW=		http://www.fpx.de/fp/Software/UUDeview/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
ALL_TARGET=	libuu.a	libuu.so.${SHLIB_VER}
USE_LDCONFIG=	yes

PORTDOCS=	*
PLIST_FILES=	include/uudeview.h lib/libuu.a lib/libuu.so \
		lib/libuu.so.${SHLIB_VER} \
		share/man/man3/uulib.3.gz

SHLIB_VER=	3

DOCFILES=	HISTORY doc/Makefile doc/README doc/binhex.fig \
		doc/library.ltx doc/structure.fig doc/td-v1.c doc/td-v2.c \
		doc/td-v3.c doc/test.txt

OPTIONS_DEFINE=	DOCS

post-patch:
	@${SED} -e 's,FUNKYTOKENHERE,${PREFIX}/,' \
		< ${FILESDIR}/uulib.3 > ${WRKDIR}/uulib.3

do-install:
	${INSTALL_LIB} ${WRKSRC}/uulib/libuu.so.${SHLIB_VER} ${PREFIX}/lib
	${LN} -sf libuu.so.${SHLIB_VER} ${PREFIX}/lib/libuu.so
	${INSTALL_DATA} ${WRKSRC}/uulib/libuu.a ${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/uulib/uudeview.h ${PREFIX}/include
	${INSTALL_MAN} ${WRKDIR}/uulib.3 ${PREFIX}/share/man/man3

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${FILESDIR}/porting.notes ${FAKE_DESTDIR}${DOCSDIR}
.for docfile in ${DOCFILES}
	${INSTALL_DATA} ${WRKSRC}/${docfile} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
