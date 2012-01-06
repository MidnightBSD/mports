# $MidnightBSD: mports/devel/google-perftools/Makefile,v 1.5 2011/08/20 13:40:57 laffer1 Exp $

PORTNAME=	google-perftools
PORTVERSION=	1.8.3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE} \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	vd/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, multi-threaded malloc() and nifty performance analysis tools
LICENSE=	bsd3

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	i386-portbld-freebsd7.0
USE_LDCONFIG=	yes
MAN1=		pprof.1


DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-${PORTVERSION}

USE_GNOME=	gnomehack

post-patch:
.if defined(NOPORTDOCS)
	${REINPLACE_CMD} -e \
		'/^install-data-am:/ s|install-dist_docDATA||' \
		${WRKSRC}/Makefile.in
.endif

check: build
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CONFIGURE_ARGS+=--enable-frame-pointers
.endif

.if ${ARCH} == "sparc64"
# src/stacktrace.cc:81:5: #error Cannnot calculate stack trace: need libunwind (see INSTALL file)
.if defined(PACKAGE_BUILDING)
IGNORE=	Does not build, need libunwind
.else
BROKEN=	Does not build, cannot calculate stack trace: need libunwind (see INSTALL file)
.endif
.endif

.include <bsd.port.post.mk>
