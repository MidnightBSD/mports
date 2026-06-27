PORTNAME=	boost-libs
PORTREVISION=	2
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

PATCHDIR=	${.CURDIR}/../boost-libs/files

COMMENT=	Framework for interfacing Python and C++
WWW=		https://www.boost.org/

LICENSE=	BSL-1.0
LICENSE_FILE=	${WRKSRC}/LICENSE_1_0.txt

BUILD_DEPENDS=	bjam:devel/boost-jam \
		${PYNUMPY}
LIB_DEPENDS=	libboost_thread.so:devel/boost-libs

USES=		python:3.9-3.12
USE_PYTHON=	flavors

OPTIONS_DEFINE=	DEBUG OPTIMIZED_CFLAGS

.include "${.CURDIR}/../boost-all/common.mk"

.include "${.CURDIR}/../boost-all/compiled.mk"

MAKE_ENV+=	PYTHON_ROOT="${LOCALBASE}"\
		PYTHON_VERSION="${PYTHON_VERSION}"\
		PYTHON_INCLUDES="${PYTHON_INCLUDEDIR}"\
		PYTHON_LIB_PATH="${PYTHON_LIBDIR}"

MAKE_ARGS+=	--with-python
ALL_TARGET=	stage

.include <bsd.port.pre.mk>

.if ${PYTHON_VER} == ${PYTHON_DEFAULT}
PLIST_SUB+=	PY_DEFAULT_ONLY=""
.else
PLIST_SUB+=	PY_DEFAULT_ONLY="@comment "
.endif

pre-build:
	@${ECHO_CMD} "using python : " ${PYTHON_VER} " : " ${PYTHON_CMD} " : " ${PYTHON_INCLUDEDIR} ";" >> ${WRKSRC}/tools/build/src/site-config.jam

do-install:
	@cd ${WRKSRC}/stage/lib && ${PAX} -rw -p p libboost* ${PREFIX}/lib
# For some reasons BJAM forget about the links
	@cd ${WRKSRC}/stage/ && ${FIND} lib -type l | ${PAX} -rw -p p ${PREFIX}
# CMake part
	@cd ${WRKSRC}/stage/lib && ${PAX} -rw -p p cmake/boost_numpy*/*-py${PYTHON_VER}.cmake ${PREFIX}/lib
	@cd ${WRKSRC}/stage/lib && ${PAX} -rw -p p cmake/boost_python*/*-py${PYTHON_VER}.cmake ${PREFIX}/lib
.if ${PYTHON_VER} == ${PYTHON_DEFAULT}
	@cd ${WRKSRC}/stage/lib && ${PAX} -rw -p p cmake/boost_numpy*/*-config*.cmake ${PREFIX}/lib
	@cd ${WRKSRC}/stage/lib && ${PAX} -rw -p p cmake/boost_python*/*-config*.cmake ${PREFIX}/lib
.endif
	@${FIND} ${PREFIX}/lib/cmake -type f -exec \
		${REINPLACE_CMD} -i '' -e 's,${FAKE_DESTDIR},,' {} +

post-install:
# display pkg-message
	@${TOUCH} ${PKGMESSAGE}
	@${CAT} ${PKG_MESSAGE_FILE_THREADS} >> ${PKGMESSAGE}
	@${ECHO_CMD} >> ${PKGMESSAGE}
	@${CAT} ${PKG_MESSAGE_FILE_PYTHON} >> ${PKGMESSAGE}
	@${ECHO_CMD} >> ${PKGMESSAGE}
	@${REINPLACE_CMD} \
		-e "s|%%LOCALBASE%%|${LOCALBASE}|g" \
		-e "s|%%PYTHON_INCLUDEDIR%%|${PYTHON_INCLUDEDIR}|g" \
		-e "s|%%PYTHON_LIBDIR%%|${PYTHON_LIBDIR}|g" \
		-e "s|%%PYTHON_VERSION%%|${PYTHON_VERSION}|g" ${PKGMESSAGE}
	@${STRIP_CMD} ${PREFIX}/lib/libboost_python*.so.${PORTVERSION}

.include <bsd.port.post.mk>
