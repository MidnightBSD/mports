# Created by: Alexander Churanov <churanov.port.maintainer@gmail.com>
# $MidnightBSD$

PORTNAME=	boost-libs
PORTVERSION=    1.55.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF/boost/boost/${PORTVERSION}
PORTVERSUFFIX=  ${PORTVERSION:C/\.[0-9]+$//}
DISTNAME=       boost_${PORTVERSION:S/./_/g}

MAINTAINER=     ports@MidnightBSD.org
COMMENT=	Free portable libraries (without Boost.Python)

LICENSE=	mit

CONFLICTS+=     boost-python-1* boost-1*

USES+=          tar:bzip2

BUILD_DEPENDS+=	bjam:${PORTSDIR}/devel/boost-jam

OPTIONS_DEFINE=	VERBOSE_BUILD DEBUG ICU OPTIMIZED_CFLAGS
OPTIONS_DEFAULT=	ICU
VERBOSE_BUILD_DESC=	Show compiler messages
ICU_DESC=		Boost.Regex with ICU unicode support

.include "${.CURDIR}/../boost-all/compiled.mk"

BJAM_ARGS+=	--without-python
.if defined(X_BUILD_FOR)
BJAM_ARGS+=	--without-context --without-coroutine \
		--without-locale --without-log
PLIST_SUB+=	COROUTINE="@comment " CONTEXT="@comment " \
		LOCALE="@comment " LOG="@comment "
.else
PLIST_SUB+=	COROUTINE="" CONTEXT="" LOCALE="" LOG=""
.endif

.if ${PORT_OPTIONS:MICU}
LIB_DEPENDS+=	libicuuc.so:${PORTSDIR}/devel/icu
BJAM_ARGS+=	-sICU_PATH=${LOCALBASE}
.else
USES+=		iconv
BJAM_ARGS+=	-sICONV_PATH=${LOCALBASE}
.endif

do-build:
	@cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${BJAM} ${BJAM_ARGS} stage
	#Compatibility layer to avoid rebuilding everything this time
	@cd ${WRKSRC}/stage/lib && \
		( for l in lib*.so.*; do ${LN} -sf $${l} $${l%.${PORTVERSION}}.5; done )

do-install:
	@cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${BJAM} --prefix=${STAGEDIR}${PREFIX} ${BJAM_ARGS} install
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
