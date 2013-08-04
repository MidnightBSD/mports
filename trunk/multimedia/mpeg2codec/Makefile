# New ports collection makefile for:	mpeg2codec
#
# $FreeBSD: ports/multimedia/mpeg2codec/Makefile,v 1.12 2005/04/24 08:03:31 ahze Exp $
# $MidnightBSD: mports/multimedia/mpeg2codec/Makefile,v 1.4 2011/09/05 20:01:54 laffer1 Exp $
#

PORTNAME=	mpeg2codec
PORTVERSION=	1.2
PORTREVISION=	3
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

MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}"
MAKE_JOBS_SAFE=	yes

DATADIR=	${PREFIX}/share/mpeg2

CFLAGS+=	-DVERIFY -DVERBOSE -DTRACE

PORTDOCS=	mpeg2enc.doc
PLIST_FILES=	bin/mpeg2decode bin/mpeg2encode \
		%%DATADIR%%/MPEG-1.par %%DATADIR%%/NTSC.par \
		%%DATADIR%%/PAL.par %%DATADIR%%/inter.mat \
		%%DATADIR%%/intra.mat
PLIST_DIRS=	%%DATADIR%%

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MX11}
USE_XORG=	xext
MAKE_ARGS+=	USE_DISP="-DDISPLAY" \
		USE_SHMEM="-DSH_MEM" \
		LIBS="$$(pkg-config --libs xext) -lX11" \
		INCLUDEDIR="$$(pkg-config --cflags xext)"
.endif

do-install:
.for i in dec enc
	${INSTALL_PROGRAM} ${WRKSRC}/src/mpeg2${i}/mpeg2${i}ode ${PREFIX}/bin
.endfor
	@${MKDIR} ${PREFIX}/${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/par/* ${PREFIX}/${DATADIR}
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/mpeg2enc.doc ${PREFIX}/${DOCSDIR}
.endif

.include <bsd.port.mk>
