# $MidnightBSD$

PORTNAME=	dvipdfmx
PORTVERSION=	20110311
CATEGORIES=	print
MASTER_SITES=	http://project.ktug.or.kr/dvipdfmx/snapshot/latest/ \
		http://project.ktug.or.kr/dvipdfmx/snapshot/archive/
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
CONFIGURE_ARGS=	--datadir=${PREFIX}/share
PLIST_SUB=	DVIPDFMDIR=${DVIPDFMDIR} \
		FONTMAPDIR=${FONTMAPDIR} \
		GLYPHMAPDIR=${GLYPHMAPDIR} \
		FONTCMAPDIR=${FONTCMAPDIR} \
		MKTEXLSR=${MKTEXLSR} \
		ADOBECMAPDIR=${ADOBECMAPDIR} \
		DVIPDFMXDIR=${DVIPDFMXDIR}

MAN1=		extractbb.1

TEXMFDIR=	share/texmf
DVIPDFMXDIR=	${TEXMFDIR}/dvipdfmx
FONTMAPDIR=	${TEXMFDIR}/fonts/map/dvipdfmx
GLYPHMAPDIR=	${TEXMFDIR}/fonts/map/glyphlist
FONTCMAPDIR=	${TEXMFDIR}/fonts/cmap
ADOBECMAPDIR=	${LOCALBASE}/share/fonts/adobe-cmaps
MKTEXLSR=	${LOCALBASE}/bin/mktexlsr

post-install:
	${MKDIR} ${PREFIX}/${FONTMAPDIR}
	${MKDIR} ${PREFIX}/${FONTCMAPDIR}
	${INSTALL_DATA} ${FILESDIR}/cid-x.map.in \
		${PREFIX}/${FONTMAPDIR}/cid-x.map
	${LN} -s -f ${ADOBECMAPDIR} \
		${PREFIX}/${FONTCMAPDIR}/adobe-cmaps
	${LN} -s -f ${PREFIX}/${DVIPDFMDIR}/CMap \
		${PREFIX}/${FONTCMAPDIR}/

.include <bsd.port.mk>
