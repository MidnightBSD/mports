# $MidnightBSD$
# $FreeBSD: ports/converters/uulib/Makefile,v 1.35 2007/01/30 10:25:23 pav Exp $

PORTNAME=	uulib
PORTVERSION=	0.5.20
PORTREVISION=	2
CATEGORIES=	converters
MASTER_SITES=	http://www.fpx.de/fp/Software/UUDeview/download/
DISTNAME=	uudeview-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for uu/xx/Base64/BinHex/yEnc de-/encoding
LICENSE=        gpl2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

ALL_TARGET=	libuu.a	libuu.so.${VERSION}
VERSION=	3

DOCFILES=	COPYING HISTORY doc/Makefile doc/README doc/binhex.fig \
		doc/library.ltx doc/structure.fig doc/td-v1.c doc/td-v2.c \
		doc/td-v3.c doc/test.txt

do-install:
	${INSTALL_DATA} ${WRKSRC}/uulib/libuu.so.${VERSION} ${PREFIX}/lib
	${LN} -sf libuu.so.${VERSION} ${PREFIX}/lib/libuu.so
	${INSTALL_DATA} ${WRKSRC}/uulib/libuu.a ${PREFIX}/lib
	@/usr/bin/ranlib ${PREFIX}/lib/libuu.a
	${INSTALL_DATA} ${WRKSRC}/uulib/uudeview.h ${PREFIX}/include
	${INSTALL_MAN} ${FILESDIR}/uulib.3 ${PREFIX}/man/man3
	${REINPLACE_CMD} -e 's,FUNKYTOKENHERE,${PREFIX}/,' \
		${PREFIX}/man/man3/uulib.3
	@# If we don't remove the .bak file, then man(1) gets confused
	@${RM} -f ${PREFIX}/man/man3/uulib.3.bak
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	@${MKDIR} ${PREFIX}/share/doc/uulib
	@${INSTALL_DATA} ${FILESDIR}/porting.notes ${DOCSDIR}
.for docfile in ${DOCFILES}
	@${INSTALL_DATA} ${WRKSRC}/${docfile} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
