# $MidnightBSD: mports/print/ttf2pt1/Makefile,v 1.2 2007/11/07 06:30:16 ctriv Exp $
# $FreeBSD: ports/print/ttf2pt1/Makefile,v 1.12 2006/12/20 17:40:36 rafan Exp $

PORTNAME=	ttf2pt1
PORTVERSION=	3.4.4
PORTREVISION=	3
CATEGORIES=	print
MASTER_SITES=	SF
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	True Type Font to Postscript Type 1 Converter
LICENSE=	bsd3

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2
RUN_DEPENDS=	t1asm:${PORTSDIR}/print/t1utils

USE_PERL5=	yes
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS} ${CPPFLAGS}" LIBS="${LDFLAGS}" \
		INSTDIR="${PREFIX}" LIBXDIR="${PREFIX}/bin"

MAN1=		ttf2pt1.1 ttf2pt1_convert.1 ttf2pt1_x2gs.1

CPPFLAGS=	`pkg-config --cflags freetype2` \
		-I${LOCALBASE}/include -DUSE_FREETYPE
LDFLAGS=	`pkg-config --libs freetype2` \
		-L${LOCALBASE}/lib -lm

.include <bsd.port.mk>
