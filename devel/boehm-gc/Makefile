PORTNAME=	gc
PORTVERSION=	8.2.8
CATEGORIES=	devel
MASTER_SITES=	https://github.com/ivmai/bdwgc/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	boehm-
.ifdef GC_VARIANT
PKGNAMESUFFIX=	-${GC_VARIANT}
.endif

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Garbage collection and memory leak detection for C and C++
WWW=		https://www.hboehm.info/gc/

LICENSE=	BDWGC
LICENSE_NAME=	Boehm-Demers-Weiser Garbage Collector License
LICENSE_TEXT=	License can be found at http://www.hboehm.info/gc/license.txt
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${LOCALBASE}/lib/libatomic_ops.a:devel/libatomic_ops

GNU_CONFIGURE=	yes
USES=		cpe libtool pathfix pkgconfig
CPE_VENDOR=	boehm-demers-weiser
CPE_PRODUCT=	garbage_collector
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--enable-cplusplus --enable-mmap --enable-static
MAKE_JOBS_UNSAFE=	yes

WRKSRC=		${WRKDIR}/${DISTNAME:C/[a-z]$//}

OPTIONS_DEFINE=	DEBUG

.ifdef GC_VARIANT
INSTLIBS=	cord gc gccpp gctba
PLIST=		${NONEXISTENT}
PLIST_FILES=	${INSTLIBS:S,^,lib/lib,:S,$,-${GC_VARIANT}.so,} \
		${INSTLIBS:S,^,lib/lib,:S,$,-${GC_VARIANT}.so.1,} \
		lib/libcord-${GC_VARIANT}.so.1.5.1 \
		lib/libgc-${GC_VARIANT}.so.1.5.4 \
		lib/libgccpp-${GC_VARIANT}.so.1.5.0 \
		lib/libgctba-${GC_VARIANT}.so.1.5.0 \
		libdata/pkgconfig/bdw-gc-${GC_VARIANT}.pc
RUN_DEPENDS+=	${LOCALBASE}/include/gc/gc.h:devel/boehm-gc
. if ${GC_VARIANT} == "redirect"
CONFIGURE_ARGS+=--disable-threads --enable-redirect-malloc
. endif
. if ${GC_VARIANT} == "threaded"
CONFIGURE_ARGS+=--enable-threads=posix --disable-redirect-malloc
PLIST_FILES+=	include/gc/gc_pthread_redirects.h
. endif
.else
CONFIGURE_ARGS+=--disable-threads --disable-redirect-malloc
OPTIONS_DEFINE+=DOCS
PORTDOCS=	*
.endif


.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=--enable-gc-debug
PKGNAMESUFFIX:=	${PKGNAMESUFFIX}+fulldebug
.endif

.ifdef GC_VARIANT
post-patch:
	@${REINPLACE_CMD} -e \
		's,libgc\.la,libgc-${GC_VARIANT}.la,g ; \
		s,libgccpp\.la,libgccpp-${GC_VARIANT}.la,g ; \
		s,libgctba\.la,libgctba-${GC_VARIANT}.la,g ; \
		s,libcord\.la,libcord-${GC_VARIANT}.la,g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's,-lgc,-lgc-${GC_VARIANT},' ${WRKSRC}/bdw-gc.pc.in

post-install:
.if ${GC_VARIANT} == "redirect"
	${RM} -r ${PREFIX}/include
.endif
	${RM} -r ${PREFIX}/share
	${MV} ${PREFIX}/libdata/pkgconfig/bdw-gc.pc \
		${PREFIX}/libdata/pkgconfig/bdw-gc-${GC_VARIANT}.pc

.else # ! GC_VARIANT

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/doc/gc.man
	@${REINPLACE_CMD} \
		-e "s|(datadir)/@PACKAGE@|(datadir)/doc/@PACKAGE@|" \
		${WRKSRC}/Makefile.in

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/gc.man ${PREFIX}/share/man/man3/gc.3
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${DOCSDIR})

.endif

regression-test: build
	(cd ${WRKSRC} && ${MAKE_CMD} check)

.include <bsd.port.mk>
