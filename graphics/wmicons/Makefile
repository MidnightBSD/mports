

PORTNAME=	wmicons
PORTVERSION=	1.0
PORTREVISION=   3
CATEGORIES=	graphics windowmaker
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL:S|%SUBDIR%|kiri/wmicons|} \
		${MASTER_SITE_WINDOWMAKER} \
		${MASTER_SITE_PORTS_JP} \
		http://www.itlb.te.noda.tus.ac.jp/~manome/wmaker/archive/
MASTER_SITE_SUBDIR=	. contrib/old/icons
DISTFILES=	${EXTRACT_ONLY} isiconpack4.tgz
EXTRACT_ONLY=	DWiconpack1.tar.gz DWiconpack2.tar.gz IconFest-1.2.tgz \
		NeXT_XEmacs_tar.gz  wm_icons_png.tar.gz wm_icons_tif.tar.gz \
		japanese-step-icons1.1.tar.gz \
		KTermIcons-1.0.tar.gz \
		WindowMaker-extra-0.1.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Icons mainly for use in Window Maker
LICENSE=	unknown

GNU_CONFIGURE=	yes

WRKSRC=		${WRKDIR}/WindowMaker-extra-0.1

WMICONDIR=	${PREFIX}/share/WindowMaker/Pixmaps
WMDOCDIR=	${PREFIX}/share/doc/wmicons

post-extract:
	${MKDIR} ${WRKDIR}/isiconpack4
	${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${DISTDIR}/isiconpack4.tgz \
		${EXTRACT_AFTER_ARGS} -C ${WRKDIR}/isiconpack4

pre-install:
	${MKDIR} ${WMDOCDIR}
	${MKDIR} ${WMICONDIR}
	cd ${WRKDIR}/IconFest-1.2; \
	${INSTALL_DATA} README ${WMDOCDIR}/README.IconFest; \
	${INSTALL_DATA} *.xpm *.tif ${WMICONDIR}
	cd ${WRKDIR}/Icons; \
	${INSTALL_DATA} *.xpm ${WMICONDIR}
	cd ${WRKDIR}/NeXT.XEmacs; \
	${INSTALL_DATA} README.NeXT.XEmacs ${WMDOCDIR}; \
	${INSTALL_DATA} ./*/*.xpm ${WMICONDIR}
	cd ${WRKDIR}/dwiconpack1; \
	${INSTALL_DATA} dwiconpack1.README ${WMDOCDIR}/README.dwiconpack1; \
	${INSTALL_DATA} *.tif ${WMICONDIR}
	cd ${WRKDIR}/dwiconpack2; \
	${INSTALL_DATA} dwiconpack2.README ${WMDOCDIR}/README.dwiconpack2; \
	${INSTALL_DATA} *.tif ${WMICONDIR}
	cd ${WRKDIR}/isiconpack4; \
	${INSTALL_DATA} CREDITS ${WMDOCDIR}; \
	${INSTALL_DATA} *.xpm *.tif ${WMICONDIR}
	cd ${WRKDIR}/japanese-step-icons; \
	${INSTALL_DATA} README.txt ${WMDOCDIR}/README.japanese-step-icons.txt; \
	${INSTALL_DATA} *.xpm ${WMICONDIR}
	cd ${WRKDIR}/vf_png; \
	${INSTALL_DATA} README ${WMDOCDIR}/README.vf_png; \
	${INSTALL_DATA} *.png ${WMICONDIR}
	cd ${WRKDIR}/vf_tif; \
	${INSTALL_DATA} README ${WMDOCDIR}/README.vf_tif; \
	${INSTALL_DATA} *.tif ${WMICONDIR}

.include <bsd.port.mk>
