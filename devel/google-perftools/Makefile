# $MidnightBSD: mports/devel/google-perftools/Makefile,v 1.4 2009/06/07 16:43:21 laffer1 Exp $

PORTNAME=	google-perftools
PORTVERSION=	1.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE} \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	vd/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, multi-threaded malloc() and nifty performance analysis tools
LICENSE=	bsd3

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	i386-portbld-freebsd7.0

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-${PORTVERSION}

pre-extract:
	@${ECHO} "This port requires sysctl machdep.tsc_freq kernel to function"

post-patch:
.if defined(NOPORTDOCS)
	${REINPLACE_CMD} -e \
		'/^install-data-am:/ s|install-dist_docDATA||' \
		${WRKSRC}/Makefile.in
.endif

post-build:
	@${ECHO}
	@${ECHO} "Be aware that 1 (heap-checker-death_unittest) out of 23 self tests is known to fail."
	@${ECHO} "Run 'make check' and try to fix that. Thanks!"
	@${ECHO} "Be aware that another self test (profiler_unittest) can randomly fail on the loaded system."
	@${ECHO}

# four of the tests are known to fail on 7.0, uncomment this as soon as this is fixed
#regression-test: check

check: build
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64" || ${ARCH} == "sparc64"
# src/stacktrace.cc:81:5: #error Cannnot calculate stack trace: need libunwind (see INSTALL file)
.if defined(PACKAGE_BUILDING)
IGNORE=	Does not build, need libunwind
.else
BROKEN=	Does not build, cannot calculate stack trace: need libunwind (see INSTALL file)
.endif
.endif

.include <bsd.port.post.mk>
