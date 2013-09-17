# $MidnightBSD$

PORTNAME=	imgvtopgm
PORTVERSION=	2.0
CATEGORIES=	palm graphics
MASTER_SITES=	http://linuxmafia.com/pub/palmos/other-os/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Palm Pilot Image Viewer to PGM Converter
LICENSE=	gpl2

LIB_DEPENDS=	netpbm.1:${PORTSDIR}/graphics/netpbm

GNU_CONFIGURE=	yes
CONFIGUR_ARGS=	--libdir=${PREFIX}

MAN1=		imgvinfo.1 imgvtopnm.1 imgvview.1 pbmtoimgv.1 \
		pgmtoimgv.1 ppmimgvquant.1

.include <bsd.port.mk>
