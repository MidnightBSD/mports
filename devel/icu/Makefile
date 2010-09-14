# $FreeBSD: ports/devel/icu/Makefile,v 1.27 2008/02/18 17:06:32 mi Exp $
# $MidnightBSD: mports/devel/icu/Makefile,v 1.4 2008/08/21 18:08:34 laffer1 Exp $
#

PORTNAME=	icu
PORTVERSION=	3.8.1
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/ICU4C/${PORTVERSION}
DISTNAME=	icu4c-${PORTVERSION:S/./_/g}
EXTRACT_SUFX=	-src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	International Components for Unicode (from IBM)
LICENSE=	mit

OPTIONS=	THREADS "Build thread-safe version of the library" on
CONFLICTS=	icu2-[0-9]*

USE_LDCONFIG=		yes

ONLY_FOR_ARCHS=	i386 amd64

WRKSRC=			${WRKDIR}/icu/source

GNU_CONFIGURE=		yes
CONFIGURE_SCRIPT=	runConfigureICU
CONFIGURE_ARGS+=	${OPSYS}
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-static
CONFIGURE_ARGS+=	--enable-samples=no
MAKE_JOBS_SAFE=		yes

USE_GMAKE=		yes

MAN1+=	derb.1
MAN1+=	genbrk.1
MAN1+=	gencnval.1
MAN1+=	genctd.1
MAN1+=	genrb.1
MAN1+=	icu-config.1
MAN1+=	makeconv.1
MAN1+=	pkgdata.1
MAN1+=	uconv.1
MAN8+=	icupkg.8
MAN8+=	genccode.8
MAN8+=	gencmn.8
MAN8+=	gensprep.8
MAN8+=	genuca.8

ICUMAJOR=	${PORTVERSION:S/.//:R}
PLIST_SUB+=	ICUMAJOR=${ICUMAJOR} ICUMINOR=1
PLIST_SUB+=	ICUVER=${PORTVERSION}

.include <bsd.port.pre.mk>

.if ${CC:T} == "cc"
CFLAGS:=	${CFLAGS:N-funroll-loops:N-O*:N-*strict-aliasing} -O2 -fno-strict-aliasing
.endif
.if ${CXX:T} == "c++"
CXXFLAGS:=	${CXXFLAGS:N-funroll-loops:N-O*:N-*strict-aliasing} -O2 -fno-strict-aliasing
.endif
CONFIGURE_ENV+=	CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"

.if defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--enable-threads=no
.else
# This builds thread-safe, but not the thread-using version:
CONFIGURE_ARGS+=	--enable-weak-threads
post-patch:
	${REINPLACE_CMD} -e 's,\(THREADSC.*FLAGS\).*,\1=${PTHREAD_CFLAGS},g' ${WRKSRC}/config/mh-bsd-gcc
.endif

iotest cintltst intltest:
	-${GMAKE} -C ${WRKSRC}/test
	cd ${WRKSRC}/test/${.TARGET} && ${SETENV} \
	    LD_LIBRARY_PATH=${WRKSRC}/lib:${WRKSRC}/tools/ctestfw \
	    ./${.TARGET}

post-build test: iotest cintltst intltest

.include <bsd.port.post.mk>
