
PORTNAME=	boost-libs
PORTREVISION=	2

COMMENT=	Free portable C++ libraries (without Boost.Python)
WWW=		https://www.boost.org/

LICENSE=	BSL-1.0
LICENSE_FILE=	${WRKSRC}/LICENSE_1_0.txt

BUILD_DEPENDS+=	bjam:devel/boost-jam

OPTIONS_DEFINE=		DEBUG OPTIMIZED_CFLAGS
OPTIONS_MULTI=		LOCALE
OPTIONS_MULTI_LOCALE=	ICONV ICU
OPTIONS_DEFAULT=	ICONV ICU
ICONV_DESC=		Boost.Locale with iconv encoding support
ICU_DESC=		Boost.Regex/Locale with ICU unicode support

ICONV_USES=		iconv
ICONV_MAKE_ARGS=	-sICONV_PATH=${ICONV_PREFIX}
ICONV_MAKE_ARGS_OFF=	boost.locale.iconv=off
ICU_LIB_DEPENDS=	libicuuc.so:devel/icu
ICU_MAKE_ARGS=		-sICU_PATH=${LOCALBASE}
ICU_MAKE_ARGS_OFF=	boost.locale.icu=off

.include "${.CURDIR}/../boost-all/common.mk"

.include "${.CURDIR}/../boost-all/compiled.mk"

MAKE_ARGS+=	--without-python
MAKE_ARGS+=	${MAKE_ARGS_${CHOSEN_COMPILER_TYPE}}
MAKE_ARGS_gcc=	xdll-path=${_GCC_RUNTIME}
ALL_TARGET=	stage

.include <bsd.port.pre.mk>

pre-build:
PLIST_SUB+= BROKE=""

do-install:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} \
		${MAKE_ARGS:NDESTDIR=*:S,^--prefix=,&${STAGEDIR},} ${INSTALL_TARGET}
	@${FIND} ${STAGEDIR}${PREFIX}/lib/cmake -type f -exec \
		${REINPLACE_CMD} -i '' -e 's,${FAKE_DESTDIR},,' {} +
# For some reasons BJAM forget about the links
	@cd ${WRKSRC}/stage/ && ${FIND} lib -type l | ${PAX} -rw -p p ${STAGEDIR}${PREFIX}

# display pkg-message
post-install:
	@${TOUCH} ${PKGMESSAGE}

	@${CAT} ${PKG_MESSAGE_FILE_THREADS} >> ${PKGMESSAGE}
	@${ECHO_CMD} >> ${PKGMESSAGE}

	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/*.so

	@${REINPLACE_CMD} \
		-e "s|%%LOCALBASE%%|${LOCALBASE}|g" \
		-e "s|%%PYTHON_INCLUDEDIR%%|${PYTHON_INCLUDEDIR}|g" \
		-e "s|%%PYTHON_LIBDIR%%|${PYTHON_LIBDIR}|g" \
		-e "s|%%PYTHON_VERSION%%|${PYTHON_VERSION}|g" ${PKGMESSAGE}

.include <bsd.port.post.mk>
