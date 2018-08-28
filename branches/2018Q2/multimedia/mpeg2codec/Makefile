# New ports collection makefile for:	mpeg2codec
#
# $FreeBSD: ports/multimedia/mpeg2codec/Makefile,v 1.12 2005/04/24 08:03:31 ahze Exp $
# $MidnightBSD$
#

PORTNAME=	mpeg2codec
PORTVERSION=	1.2
PORTREVISION=	4
CATEGORIES=	multimedia
MASTER_SITES=	http://fossies.org/unix/misc/old/ \
		http://www.imagemagick.org/download/delegates/ \
		http://gd.tuwien.ac.at/graphics/libs/alsolibs/ \
		http://www.mpeg.org/pub_ftp/mpeg/mssg/
DISTNAME=	mpeg2vidcodec_v12

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG-2 Encoder and Decoder

LICENSE=	other

OPTIONS_DEFINE=	X11 DOCS
OPTIONS_DEFAULT=	X11

WRKSRC=		${WRKDIR}/mpeg2

USES=		pkgconfig

MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}"

DATADIR=	${PREFIX}/share/mpeg2

CFLAGS+=	-DVERIFY -DVERBOSE -DTRACE

X11_USE=	XORG=xext xorg-macros
X11_MAKE_ARGS=	USE_DISP="-DDISPLAY" \
		USE_SHMEM="-DSH_MEM" \
		LIBS="$$(pkg-config --libs xext) -lX11" \
		INCLUDEDIR="$$(pkg-config --cflags xext)"

do-install:
.for i in dec enc
	${INSTALL_PROGRAM} ${WRKSRC}/src/mpeg2${i}/mpeg2${i}ode ${PREFIX}/bin
.endfor
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/par/* ${DATADIR}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/mpeg2enc.doc ${DOCSDIR}

.include <bsd.port.mk>
