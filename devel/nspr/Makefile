# $MidnightBSD$

PORTNAME=	nspr
DISTVERSION=	4.10.9
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/v${PORTVERSION}/src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Platform-neutral API for system level and libc like functions

LICENSE=	lgpl
# lgpl, gpl2, or mpl

WRKSRC=		${WRKDIR}/${DISTNAME}/nspr/build

USES=		cpe gmake
CPE_VENDOR=	mozilla
CPE_PRODUCT=	netscape_portable_runtime
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_SCRIPT=../configure
CONFIGURE_ARGS=	--srcdir=${WRKSRC:H}

MAKE_ENV=	DIST=${WRKSRC}/dist

LIBRARIES=	libnspr4.so.1 libplc4.so.1 libplds4.so.1

OPTIONS_DEFINE=	DEBUG

DEBUG_CONFIGURE_ENABLE=debug

do-install:
	${MKDIR} ${PREFIX}/include/nspr
	${TAR} -C ${WRKSRC}/dist/include --dereference -cf - . | \
	    	${TAR} -C ${PREFIX}/include -xof -
	${FIND} ${PREFIX}/include/nspr -type d | \
	    	${XARGS} ${CHMOD} 0755
	${FIND} ${PREFIX}/include/nspr -type f | \
	    	${XARGS} ${CHMOD} ${SHAREMODE}
	${TAR} -C ${WRKSRC}/dist/lib --dereference -cf - . | \
	    	${TAR} -C ${PREFIX}/lib -xof -
	${INSTALL_SCRIPT} ${WRKSRC}/config/nspr-config ${PREFIX}/bin
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/config/nspr.pc ${PREFIX}/libdata/pkgconfig
.for lib in ${LIBRARIES}
.if defined(STRIP) && ${STRIP} != ""
	${STRIP_CMD} ${PREFIX}/lib/${lib}
.endif
	${CHMOD} ${BINMODE} ${PREFIX}/lib/${lib}
	${LN} -sf ${lib} ${PREFIX}/lib/${lib:R}
.endfor

prtests:
	${DO_MAKE_BUILD} -C ${WRKSRC}/pr/tests
	${LN} -sf libmy.so.1 ${WRKSRC}/pr/tests/dll/libmy.so
	cd ${WRKSRC}/pr/tests && ../../../pr/tests/runtests.sh

libtests:
	${DO_MAKE_BUILD} -C ${WRKSRC}/lib/tests
	${WRKSRC}/lib/tests/string
	${WRKSRC}/lib/tests/base64t
	# The test below is commented out, because arena requires
	# command-line arguments. If you can provide reasonable values
	# for it, please contact ${MAINTAINER}. Thank you.
	#	${WRKSRC}/lib/tests/arena
	#

test: libtests prtests

#regression-test: test

#.if defined(PACKAGE_BUILDING)
#post-build: test
#.else
post-build:
	#
	# Please, consider running ``make test'' to find any
	# possible build problems.
	#
#.endif

.include <bsd.port.mk>
