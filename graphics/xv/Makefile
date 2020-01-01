# $MidnightBSD$

PORTNAME=	xv
PORTVERSION=	3.10a
PORTREVISION=	16
CATEGORIES+=	graphics
MASTER_SITES=	ftp://ftp.cis.upenn.edu/pub/xv/:base \
		SF/png-mng/XV%20jumbo%20patches/20070520

DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:base \
		${DISTNAME}-jumbo-patches-20070520.tar.gz
DIST_SUBDIR=	${PORTNAME}

PATCH_SITES=	http://www.gregroelofs.com/code/
PATCHFILES=	xv-3.10a-enhancements.20070520-20081216.diff

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	X11 program that displays images of various formats

LICENSE=	xv
LICENSE_NAME=	xv shareware license
LICENSE_FILE=	${WRKSRC}/copyright.h
LICENSE_PERMS=	
# non commericial use only

LIB_DEPENDS=	libtiff.so:graphics/tiff \
		libpng.so:graphics/png \
		libjasper.so:graphics/jasper

USES=		imake jpeg
USE_XORG=	xext x11 xt

OPTIONS_DEFINE=	M17N DOCS
M17N_DESC=	build with Multilingualization support

.include <bsd.mport.options.mk>

.if defined(CC) && ${CC:T:Mclang}
# Optimizer crashes with
# Assertion failed: (isPtrIV == IndVar->getType()->isPointerTy() && "IndVar type must match IVInit type")
CFLAGS:= ${CFLAGS:S/-O2//g}
.endif

.if ${PORT_OPTIONS:MM17N}
MAKE_ENV=	LOCALE_EXTENSION=-DTV_MULTILINGUAL
DESCR=	${FILESDIR}/pkg-descr
.endif

pre-patch:
	${PATCH} -d ${PATCH_WRKSRC} ${PATCH_ARGS} -p1 < ${WRKDIR}/xv-3.10a-jumbo-fix-enh-patch-20070520.txt

post-patch:
	${REINPLACE_CMD} -e "s@%%LOCALBASE%%@${LOCALBASE}@" \
		${WRKSRC}/config.h
.for i in bggen.1 vdcomp.1 xcmap.1 xv.1 xvp2p.1
	${CP} ${WRKSRC}/docs/${i:R}.man ${WRKSRC}
.endfor

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/README.jumbo ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/README.pcd ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/docs/epsf.ps ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/docs/xpm.ps ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/docs/xvdocs.ps ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/docs/xvtitle.ps ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/docs/help ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/docs/bmp.doc ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/docs/gif* ${DOCSDIR}/
.endif

.include <bsd.port.mk>
