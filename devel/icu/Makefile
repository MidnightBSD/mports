# $FreeBSD: ports/devel/icu/Makefile,v 1.27 2008/02/18 17:06:32 mi Exp $
# $MidnightBSD$
#

PORTNAME=	icu
PORTVERSION=	55.1
CATEGORIES=	devel
MASTER_SITES=	http://download.icu-project.org/files/icu4c/${PORTVERSION}/ \
		SF/${PORTNAME}/ICU4C/${PORTVERSION}/
DISTNAME=	icu4c-${PORTVERSION:S/./_/g}
EXTRACT_SUFX=	-src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	International Components for Unicode (from IBM)

LICENSE=	icu
LICENSE_NAME=	ICU license
LICENSE_FILE=	${WRKSRC}/../license.html
LICENSE_PERMS=	${_LICENSE_PERMS_DEFAULT}

GNU_CONFIGURE=		yes
OPTIONS_DEFINE=	THREADS
OPTIONS_DEFAULT=	THREADS
THREADS_DESC=	Build thread-safe version of the library

USE_LDCONFIG=		yes

WRKSRC=			${WRKDIR}/icu/source

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-data-packaging=library \
			--disable-samples \
			--enable-release \
			--enable-shared \
			--enable-static

.if defined(X_BUILD_FOR)
CONFIGURE_ARGS+=	--with-cross-build
.endif


USES=			gmake pathfix

ICUMAJOR=	${PORTVERSION:C/\..*//}
PLIST_SUB+=	ICUMAJOR=${ICUMAJOR} ICUVER=${PORTVERSION}

# This builds thread-safe, but not the thread-using version:
THREADS_CONFIGURE_ON=	--enable-weak-threads
THREADS_CONFIGURE_OFF=	--enable-threads=no

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e '/CXXFLAGS=/s/-ansi//' \
		${WRKSRC}/configure
.if ! ${PORT_OPTIONS:MTHREADS}
	@${REINPLACE_CMD} -e 's,\(THREADSC.*FLAGS\).*,\1=,g' ${WRKSRC}/config/mh-bsd-gcc
.endif

iotest cintltst intltest:
	# Performing the ${.TARGET} test
	-${MAKE_CMD} -C ${WRKSRC}/test
	cd ${WRKSRC}/test/${.TARGET} && ${SETENV} \
	    LD_LIBRARY_PATH=${WRKSRC}/lib:${WRKSRC}/tools/ctestfw \
	    ./${.TARGET}

post-stage:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/g* \
		${STAGEDIR}${PREFIX}/bin/*conv \
		${STAGEDIR}${PREFIX}/bin/icuinfo \
		${STAGEDIR}${PREFIX}/bin/derb \
		${STAGEDIR}${PREFIX}/bin/pkgdata
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/sbin/*
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libicuda*.so.*

test regression-test: iotest cintltst intltest

.include <bsd.port.mk>
