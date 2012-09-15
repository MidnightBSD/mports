# $MidnightBSD: mports/devel/boost-python-libs/Makefile,v 1.1 2012/09/15 19:26:54 laffer1 Exp $

PORTNAME=	boost-python-libs
PORTVERSION=	1.48.0
PORTVERSUFFIX=	${PORTVERSION:C/\.[0-9]+$//}
CATEGORIES=	devel
MASTER_SITES=	SF/boost/boost/${PORTVERSION}
DISTNAME=	boost_${PORTVERSION:S/./_/g}

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Framework for interfacing Python and C++
LICENSE=	mit

CONFLICTS=	boost-python-1* boost-1*

USE_BZIP2=	yes
USE_PYTHON=	2.5-3.1

OPTIONS=	VERBOSE_BUILD	"Show compiler messages"	off \
		DEBUG		"Build debugging symbols"	off \
		OPTIMIZED_CFLAGS "Enable -O3 optimization"	off

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/devel/boost-all/compiled.mk"

.if ${ARCH} == "sparc64"
CXXFLAGS=	-O0
.endif

MAKE_ENV+=	PYTHON_ROOT="${LOCALBASE}"\
		PYTHON_VERSION="${PYTHON_VERSION}"\
		PYTHON_INCLUDES="${PYTHON_INCLUDEDIR}"\
		PYTHON_LIB_PATH="${PYTHON_LIBDIR}"

RUN_DEPENDS+=	${LOCALBASE}/lib/libboost_thread.so.${BOOST_SHARED_LIB_VER}:${PORTSDIR}/devel/boost-libs

BUILD_DEPENDS+=	${BJAM}:${PORTSDIR}/devel/boost-jam

post-patch: customize-boost-build

do-build:
	${ECHO_CMD} "using python : " ${PYTHON_VER} ";" >> ${WRKSRC}/tools/build/v2/site-config.jam
# build the library
	cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${BJAM} ${BJAM_OPTIONS} --prefix=${PREFIX}\
		--toolset=${BOOST_TOOLS} --with-python

# Remove non-python headers
	cd ${WRKSRC} && \
 	${FIND} boost -not -path '*boost/python*' -delete

do-install:
# Install libraries
	${FIND} ${WRKSRC}/bin.v2/libs/python -type f -name "*.a"\
 		-exec ${INSTALL_DATA} \{\} ${PREFIX}/lib \;

	${FIND} -E ${WRKSRC}/bin.v2/libs/python -type f \
 		-regex '.*so' \
		-exec ${INSTALL_DATA} \{\} ${PREFIX}/lib \;

# Create symlink for shared library
	cd ${PREFIX}/lib/ && \
	${MV} "libboost_python.so" "libboost_python.so.${BOOST_SHARED_LIB_VER}" && \
	${LN} -fs "libboost_python.so.${BOOST_SHARED_LIB_VER}" "libboost_python.so"

# Install headers
	cd ${WRKSRC} && \
	${FIND} boost -type d -a \! -name "*.orig"\
		-exec ${MKDIR} ${PREFIX}/include/\{\} \;

	cd ${WRKSRC} && \
	${FIND} boost -type f -a \! -name "*.orig"\
		-exec ${INSTALL_DATA} \{\} ${PREFIX}/include/\{\} \;

post-install:
# display pkg-message
	@${TOUCH} ${PKGMESSAGE}
	@${CAT} ${PKG_MESSAGE_FILE_THREADS} >> ${PKGMESSAGE}
	@${ECHO_CMD} >> ${PKGMESSAGE}
	@${CAT} ${PKG_MESSAGE_FILE_PYTHON} >> ${PKGMESSAGE}
	@${ECHO_CMD} >> ${PKGMESSAGE}
	@${REINPLACE_CMD} \
		-e "s|%%LOCALBASE%%|${LOCALBASE}|g" \
		-e "s|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|g" \
		-e "s|%%PYTHON_INCLUDEDIR%%|${PYTHON_INCLUDEDIR}|g" \
		-e "s|%%PYTHON_LIBDIR%%|${PYTHON_LIBDIR}|g" \
		-e "s|%%PYTHON_VERSION%%|${PYTHON_VERSION}|g" ${PKGMESSAGE}
	@if [ -s ${PKGMESSAGE} ]; then \
	${ECHO_CMD} ; \
	${ECHO_CMD} "===============================================================================" ; \
	${ECHO_CMD} ; \
	${CAT} ${PKGMESSAGE}; \
	${ECHO_CMD} "===============================================================================" ; \
	${ECHO_CMD} ; \
	fi

.include <bsd.port.post.mk>
