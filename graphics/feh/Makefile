PORTNAME=	feh
PORTVERSION=	3.10.3
CATEGORIES=	graphics
MASTER_SITES=	https://feh.finalrewind.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image viewer that utilizes Imlib2
WWW=		https://feh.finalrewind.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libImlib2.so:graphics/imlib2 \
		libpng.so:graphics/png

USES=		cpe desktop-file-utils gmake localbase:ldflags tar:bzip2 xorg
CPE_VENDOR=	feh_project
USE_XORG=	x11 xinerama xt

MAKE_ENV+=	LDFLAGS="${LDFLAGS}" \
		verscmp=0

NO_TEST=	yes

OPTIONS_DEFINE=		CURL DCRAW DOCS EXAMPLES EXIF XINERAMA
OPTIONS_DEFAULT=	CURL EXIF XINERAMA
OPTIONS_SUB=		yes

DCRAW_DESC=	Use dcraw to display raw file previews
EXIF_DESC=	Support EXIF tags

CURL_LIB_DEPENDS=	libcurl.so:ftp/curl
CURL_MAKE_ENV=		curl=1
CURL_MAKE_ENV_OFF=	curl=0
DCRAW_RUN_DEPENDS=	dcraw:graphics/dcraw
EXIF_LIB_DEPENDS=	libexif.so:graphics/libexif
EXIF_MAKE_ENV=		exif=1
EXIF_MAKE_ENV_OFF=	exif=0
XINERAMA_MAKE_ENV=	xinerama=1
XINERAMA_MAKE_ENV_OFF=	xinerama=0

post-patch-DOCS-off:
	@${REINPLACE_CMD} -e 's|install-doc||' \
		${WRKSRC}/Makefile

post-patch-EXAMPLES-off:
	@${REINPLACE_CMD} -e 's|install-examples||' \
		${WRKSRC}/Makefile

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/feh

.include <bsd.port.mk>
