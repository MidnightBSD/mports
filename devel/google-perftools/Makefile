# Created by: Yuri Victorovich <yuri@rawbw.com>

PORTNAME=	google-perftools
DISTVERSIONPREFIX=	gperftools-
DISTVERSION=	2.8
CATEGORIES=	devel
MASTER_SITES=	https://github.com/gperftools/gperftools/releases/download/gperftools-${PORTVERSION}/
DISTNAME=	gperftools-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, multi-threaded malloc() and nifty performance analysis tools

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gmake libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
NO_TEST=	yes

LIBS+=		-lexecinfo

DOCSDIR=	${PREFIX}/share/doc/gperftools

OPTIONS_DEFINE=		DOCS
OPTIONS_SINGLE=		PAGESIZE ALIGN
OPTIONS_SINGLE_ALIGN=	ALIGN8 ALIGN16
OPTIONS_SINGLE_PAGESIZE=	PAGE8K PAGE32K PAGE64K
OPTIONS_DEFAULT=	PAGE8K ALIGN16

ALIGN_DESC=	The tcmalloc allocation alignment
ALIGN8_DESC=	8 bytes allocation alignment
ALIGN16_DESC=	16 bytes allocation alignment
PAGESIZE_DESC=	The tcmalloc internal page size
PAGE8K_DESC=	8K page size
PAGE32K_DESC=	32K page size
PAGE64K_DESC=	64K page size

ALIGN8_CONFIGURE_ON=	--with-tcmalloc-alignment=8
ALIGN16_CONFIGURE_ON=	--with-tcmalloc-alignment=16
PAGE8K_CONFIGURE_ON=	--with-tcmalloc-pagesize=8
PAGE32K_CONFIGURE_ON=	--with-tcmalloc-pagesize=32
PAGE64K_CONFIGURE_ON=	--with-tcmalloc-pagesize=64

PORTDOCS=	*

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == "clang" && !defined(USE_GCC)
# clang cannot disable builtins individually
CXXFLAGS+=	-fno-builtin
.endif

.if ${ARCH} == "amd64"
CONFIGURE_ARGS+=--enable-frame-pointers
.endif

# keep in sync with all platforms where libunwind is available
.if (${ARCH} == amd64 || ${ARCH} == i386)
LIB_DEPENDS+=	libunwind.so:devel/libunwind
.endif

post-install:
	${MV} ${STAGEDIR}${PREFIX}/bin/pprof ${STAGEDIR}${PREFIX}/bin/perftools-pprof
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/lib*.so.*

.include <bsd.port.post.mk>
