# New ports collection makefile for:    dvipdfmx
# Date created:		8 March 2001
# Whom:			Shen Chuan-Hsing <statue@freebsd.sinica.edu.tw>
#
# $MidnightBSD: mports/print/dvipdfmx/Makefile,v 1.3 2011/01/15 03:23:22 laffer1 Exp $
# $FreeBSD: ports/print/dvipdfmx/Makefile,v 1.24 2006/07/02 11:29:21 matusita Exp $
#

PORTNAME=	dvipdfmx
PORTVERSION=	20061211
PORTREVISION=	3
CATEGORIES=	print
MASTER_SITES=	http://project.ktug.or.kr/dvipdfmx/snapshot/archive/
DIST_SUBDIR=	dvipdfmx

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dvipdfm with Asian languages by CID-keyed font technology support
LICENSE=	gpl2

BUILD_DEPENDS=	${PREFIX}/lib/libkpathsea.a:${PORTSDIR}/print/teTeX-base
LIB_DEPENDS=	png:${PORTSDIR}/graphics/png \
		paper:${PORTSDIR}/print/libpaper
RUN_DEPENDS=	${ADOBECMAPDIR}/ai0/CMap/Identity-H:${PORTSDIR}/print/adobe-cmaps \
		kpsepath:${PORTSDIR}/print/teTeX-base

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--datadir=${PREFIX}/${TEXMFDIR}
PLIST_SUB=	DVIPDFMDIR=${DVIPDFMDIR} \
		FONTMAPDIR=${FONTMAPDIR} \
		FONTCMAPDIR=${FONTCMAPDIR} \
		MKTEXLSR=${MKTEXLSR} \
		ADOBECMAPDIR=${ADOBECMAPDIR}

TEXMFDIR=	share/texmf
DVIPDFMDIR=	${TEXMFDIR}/dvipdfm
FONTMAPDIR=	${TEXMFDIR}/fonts/map/dvipdfm
FONTCMAPDIR=	${TEXMFDIR}/fonts/cmap/dvipdfm
ADOBECMAPDIR=	${LOCALBASE}/share/fonts/adobe-cmaps
MKTEXLSR=	${LOCALBASE}/bin/mktexlsr

pre-install:
	${RM} -f ${WRKSRC}/data/config/dvipdfmx.cfg.orig \
		${WRKSRC}/data/config/cid-x.map

post-install:
	${MKDIR} ${PREFIX}/${FONTMAPDIR}
	${MV} ${PREFIX}/${TEXMFDIR}/dvipdfm/config/glyphlist.txt \
		${PREFIX}/${FONTMAPDIR}/glyphlist.txt
	${MKDIR} ${PREFIX}/${FONTCMAPDIR}
	${INSTALL_DATA} ${FILESDIR}/cid-x.map.in \
		${PREFIX}/${FONTMAPDIR}/cid-x.map
	${LN} -s -f ${ADOBECMAPDIR} \
		${PREFIX}/${FONTCMAPDIR}/adobe-cmaps
	${LN} -s -f ${PREFIX}/${DVIPDFMDIR}/CMap \
		${PREFIX}/${FONTCMAPDIR}/

.include <bsd.port.mk>
