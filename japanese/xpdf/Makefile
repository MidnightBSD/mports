PORTNAME=	xpdf
PORTVERSION=	4.02
CATEGORIES=	japanese
MASTER_SITES=	https://xpdfreader-dl.s3.amazonaws.com/
PKGNAMESUFFIX=	-jafont
DISTNAME=	xpdf-japanese
DIST_SUBDIR=	${DISTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese font support for xpdf

LICENSE=	gpl2

RUN_DEPENDS=	xpdf:graphics/xpdf \
		${ADOBECMAPDIR}/ai0/CMap/Identity-H:print/adobe-cmaps \
		${FONTSDIR}/Ryumin-Light:japanese/font-std \
		${FONTSDIR}/GothicBBB-Medium:japanese/font-std

USES=		cpe

CPE_VENDOR=	xpdfreader

NO_BUILD=	yes
SUB_FILES=	dot.xpdfrc
SUB_LIST=	ADOBECMAPDIR=${ADOBECMAPDIR} \
		FONTSDIR=${FONTSDIR}
PLIST_SUB=	EXTRARC=${EXTRARC}

FONTSDIR=	${LOCALBASE}/share/fonts/std.ja_JP
EXTRARC=	${DATADIR}/japanese/dot.xpdfrc
ADOBECMAPDIR=	${LOCALBASE}/share/fonts/adobe-cmaps
INSTALL_FILES=	Adobe-Japan1.cidToUnicode ISO-2022-JP.unicodeMap \
		EUC-JP.unicodeMap Shift-JIS.unicodeMap \
		README ../dot.xpdfrc

do-install:
	${MKDIR} ${DATADIR}/japanese
	cd ${WRKSRC} && \
	    ${INSTALL_DATA} ${INSTALL_FILES} ${DATADIR}/japanese
	${MKDIR} ${STAGEDIR}${DATADIR}/japanese/CMap
	cd ${DATADIR}/japanese/CMap && \
	    ${FIND} ${FAKE_DESTDIR}${ADOBECMAPDIR}/aj16/CMap ${FAKE_DESTDIR}${ADOBECMAPDIR}/aj20/CMap \
		-type f -exec ${LN} -s -f {} . \;

.include <bsd.port.mk>
