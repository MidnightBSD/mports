PORTNAME=	lcms
PORTVERSION=	1.19
PORTREVISION=	4
PORTEPOCH=	1
CATEGORIES=	graphics
MASTER_SITES=	SF \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Light Color Management System -- a color management library
WWW=		https://www.littlecms.com/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

OPTIONS_DEFINE=	DOCS JPEGICC TIFFICC
OPTIONS_DEFAULT=JPEGICC TIFFICC
OPTIONS_SUB=	yes
JPEGICC_DESC=	Build color profile applier for JPEG
TIFFICC_DESC=	Build color profile applier for TIFF

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
USE_LDCONFIG=	yes
USES=		cpe libtool localbase:ldflags pathfix

PORTDOCS=	*

CPE_VENDOR=	littlecms
CPE_PRODUCT=	little_cms_color_engine

JPEGICC_CONFIGURE_WITH=	jpeg
JPEGICC_USES=		jpeg
TIFFICC_CONFIGURE_WITH=	tiff
TIFFICC_LIB_DEPENDS=	libtiff.so:graphics/tiff

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS = / s| python samples||' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e '/^#ifdef __sgi/ s|__sgi|__unix__|; /^#include "sgidefs.h"/d' ${WRKSRC}/include/icc34.h.in
	@${REINPLACE_CMD} -e '/^testcms_LDFLAGS = / s|$$| -static|' ${WRKSRC}/testbed/Makefile.in

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} doc/LCMSAPI.TXT doc/TUTORIAL.TXT tifficc/tifficc.c \
		jpegicc/jpegicc.c jpegicc/iccjpeg.c samples/wtpt.c samples/icctrans.c ${STAGEDIR}${DOCSDIR}/

regression-test test: build
	cd ${WRKSRC}/testbed/ && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} check

.include <bsd.port.mk>
