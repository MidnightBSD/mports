PORTNAME=	xv
PORTVERSION=	5.2.0
DISTVERSIONPREFIX=	v
PORTREVISION=	0
CATEGORIES+=	graphics
DIST_SUBDIR=	${PORTNAME}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	X11 program that displays images of various formats
WWW=		http://www.trilon.com/xv/

LICENSE=	xv
LICENSE_NAME=	xv shareware license
LICENSE_FILE=	${WRKSRC}/src/README
LICENSE_PERMS=	
# non commericial use only

LIB_DEPENDS=	libtiff.so:graphics/tiff \
		libpng.so:graphics/png \
		libjasper.so:graphics/jasper \
		libwebp.so:graphics/webp

USES=		cpe localbase cmake jpeg xorg
USE_XORG=	xext x11 xt ice sm

USE_GITHUB=	yes
GH_ACCOUNT=	jasper-software

CPE_VENDOR=	xv_project

OPTIONS_DEFINE=	M17N DOCS
M17N_DESC=	build with Multilingualization support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MM17N}
CFLAGS+=	-DTV_MULTILINGUAL
DESCR=	${FILESDIR}/pkg-descr
CONFLICTS_INSTALL=	xv
.else
CONFLICTS_INSTALL=	xv-m17n
.endif

XV_DOCS=	README.md src/docs/help

do-install-DOCS-on:
.for i in ${XV_DOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

do-install-DOCS-off:
	${RM} -fr ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
