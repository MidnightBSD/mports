PORTNAME=	freetype2
DISTVERSION=	2.13.3
CATEGORIES=	print
MASTER_SITES=	SAVANNAH/${PORTNAME:S/2//} \
		SF/freetype/${PORTNAME}/${DISTVERSION:C/^([0-9]+\.[0-9]+\.[0-9]+).*/\1/}/
DISTNAME=	${PORTNAME:S/2//}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free and portable TrueType font rendering engine
WWW=		https://www.freetype.org/

LICENSE=	FTL gpl2+
LICENSE_COMB=	dual
LICENSE_NAME_FTL=	The FreeType Project license
LICENSE_FILE_FTL=	${WRKSRC}/docs/FTL.TXT
LICENSE_FILE_gpl2+ =	${WRKSRC}/docs/GPLv2.TXT
LICENSE_PERMS_FTL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		cmake cpe localbase pathfix pkgconfig tar:xz

CPE_PRODUCT=	freetype
CPE_VENDOR=	freetype
USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS \
		DISABLE_FORCE_DEBUG_POSTFIX \
		FT_REQUIRE_BZIP2 \
		FT_REQUIRE_ZLIB \
		FT_DISABLE_HARFBUZZ

SUB_FILES=	pkg-message

PORTDOCS=	CHANGES FTL.TXT formats.txt raster.txt reference

OPTIONS_DEFINE=		BROTLI DEBUG DOCS LONG_PCF_NAMES PNG TABLE_VALIDATION
OPTIONS_DEFAULT=	BROTLI LCD_RENDERING LONG_PCF_NAMES PNG V40
OPTIONS_SUB=		yes

OPTIONS_SINGLE=		RENDERING
OPTIONS_SINGLE_RENDERING=	LCD_FILTERING LCD_RENDERING

OPTIONS_RADIO=		SIZE_METRICS_CHOICE
OPTIONS_RADIO_SIZE_METRICS_CHOICE=	TT_SIZE_METRICS

LONG_PCF_NAMES_DESC=	Enable long PCF family names
TABLE_VALIDATION_DESC=	TrueType GX/AAT and OpenType table validation
RENDERING_DESC=		Rendering technology
LCD_FILTERING_DESC=	Subpixel rendering (patented)
LCD_RENDERING_DESC=	Harmony LCD rendering
SUBPIXEL_HINTING_DESC=	Subpixel hinting support
SIZE_METRICS_CHOICE_DESC=	Size metrics for TrueType fonts
TT_SIZE_METRICS_DESC=	TrueType-like size metrics for 'light' auto-hinting

BROTLI_LIB_DEPENDS=	libbrotlidec.so:archivers/brotli
BROTLI_CMAKE_BOOL=	FT_REQUIRE_BROTLI
BROTLI_CMAKE_BOOL_OFF=	FT_DISABLE_BROTLI

PNG_LIB_DEPENDS=	libpng.so:graphics/png
PNG_CMAKE_BOOL=		FT_REQUIRE_PNG
PNG_CMAKE_BOOL_OFF=	FT_DISABLE_PNG

LCD_FILTERING_CFLAGS=	-DFT_CONFIG_OPTION_SUBPIXEL_RENDERING

.include <bsd.port.pre.mk>

SELECTED_MODE=	\
	r=0; \
	for m in ${SUBPIXEL_HINTING_MODE}; \
		do r=$$(($$r | $$m)); \
	done; \
	${ECHO_CMD} $$r

pre-patch:
	@${REINPLACE_CMD} -e 's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/builds/unix/install.mk

post-patch:
.if defined(SUBPIXEL_HINTING_MODE)
	@${REINPLACE_CMD} -i '.hinting.bak' \
		-e 's|^\(#define TT_CONFIG_OPTION_SUBPIXEL_HINTING\).*|\1 \
	${SELECTED_MODE:sh}|' \
		${WRKSRC}/include/freetype/config/ftoption.h
.else
	@${REINPLACE_CMD} -i '.hinting.bak' \
		-e 's|^\(#define TT_CONFIG_OPTION_SUBPIXEL_HINTING.*\)|/* \1 */|' \
		${WRKSRC}/include/freetype/config/ftoption.h
.endif

post-patch-DEBUG-on:
	@${REINPLACE_CMD} -i '.debug.bak' \
		-e 's|.*\(#define FT_DEBUG_LEVEL_TRACE\).*|\1|' \
		-e 's|.*\(#define FT_DEBUG_MEMORY\).*|\1|' \
		${WRKSRC}/include/freetype/config/ftoption.h

post-patch-LONG_PCF_NAMES-on:
	@${REINPLACE_CMD} -i '.names.bak' \
		-e 's|.*\(#define PCF_CONFIG_OPTION_LONG_FAMILY_NAMES\).*|\1|' \
		${WRKSRC}/include/freetype/config/ftoption.h

post-patch-TABLE_VALIDATION-on:
	@${REINPLACE_CMD} -e '/valid$$/s|#.*\(AUX_MODULES\)|\1|' \
		${WRKSRC}/modules.cfg

post-patch-TT_SIZE_METRICS-on:
	@${REINPLACE_CMD} -i '.metrics.bak' \
		-e 's|.*\(#define AF_CONFIG_OPTION_TT_SIZE_METRICS\).*|\1|' \
		${WRKSRC}/include/freetype/config/ftoption.h

post-install-DOCS-on:
	(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} "${PORTDOCS}" ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.post.mk>
