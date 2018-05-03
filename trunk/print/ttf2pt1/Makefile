# $MidnightBSD$
# $FreeBSD: ports/print/ttf2pt1/Makefile,v 1.12 2006/12/20 17:40:36 rafan Exp $

PORTNAME=	ttf2pt1
PORTVERSION=	3.4.4
PORTREVISION=	6
CATEGORIES=	print
MASTER_SITES=	SF
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	True Type Font to Postscript Type 1 Converter

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

LIB_DEPENDS=	libfreetype.so:print/freetype2
RUN_DEPENDS=	t1asm:print/t1utils

USES=		pkgconfig perl5 uidfix tar:tgz
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS} ${CPPFLAGS}" LIBS="${LIBS}" \
		INSTDIR="${FAKE_DESTDIR}${TRUE_PREFIX}" LIBXDIR="${FAKE_DESTDIR}${TRUE_PREFIX}/bin" \
		OWNER=${BINOWN} GROUP=${BINGRP}
SHEBANG_FILES=	app/TeX/sfd2map \
		app/TeX/cjk-latex-config \
		other/showdf \
		other/showg \
		other/*.pl \
		scripts/forceiso \
		scripts/frommap \
		scripts/inst_dir \
		scripts/html2man \
		scripts/t1fdir \
		scripts/trans


CPPFLAGS+=	`pkg-config --cflags freetype2` \
		-I${LOCALBASE}/include -DUSE_FREETYPE
LIBS+=		`pkg-config --libs freetype2` \
		-L${LOCALBASE}/lib -lm

post-install:
	${STRIP_CMD} ${PREFIX}/bin/ttf2pt1
	${SED} -i '' 's,${FAKE_DESTDIR},,' ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/ttf2pt1_convert \
		${PREFIX}/man/man1/ttf2pt1_x2gs.1 \
		${PREFIX}/man/man1/ttf2pt1.1 \
		${PREFIX}/man/man1/ttf2pt1_convert.1 \
		${DATADIR}/scripts/convert

.include <bsd.port.mk>
