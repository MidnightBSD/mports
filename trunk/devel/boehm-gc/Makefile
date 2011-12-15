# $MidnightBSD: mports/devel/boehm-gc/Makefile,v 1.4 2011/02/02 20:17:32 laffer1 Exp $

PORTNAME=	boehm-gc
PORTVERSION=	6.8
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/
DISTNAME=	gc${PORTVERSION:S/.a/alpha/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Garbage collection and memory leak detection for C and C++
LICENSE=	other

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-cplusplus
OPTIONS=	REDIRECT "Define malloc(3)-family replacements" off \
		FULLDEBUG "full-debug support (see documentation)" off \
		THREADING "POSIX thread support" off \
		PARALLEL_MARK "Parallel-thread marking (faster for SMP)" off

.include <bsd.port.pre.mk>

.if defined(WITH_THREADING)
CONFIGURE_ARGS+=	--enable-threads=posix --enable-thread-local-alloc
CONFIGURE_ENV=	CFLAGSS="${CFLAGS} ${PTHREAD_CFLAGS}" \
		LIBS="${LIBS} ${PTHREAD_LIBS:C/-pthread/-lpthread/}"
.if defined(WITH_PARALLEL_MARK)
CONFIGURE_ARGS+=	--enable-parallel-mark
.endif
PKGNAMESUFFIX=		+threaded
.else
CONFIGURE_ARGS+=	--disable-threads
PKGNAMESUFFIX=		# empty
.endif
.if defined(WITH_REDIRECT)
CONFIGURE_ARGS+=	--enable-redirect-malloc
PKGNAMESUFFIX:=		${PKGNAMESUFFIX}+redirect
.endif
.if defined(WITH_FULLDEBUG)
CONFIGURE_ARGS+=	--enable-full-debug
PKGNAMESUFFIX:=		${PKGNAMESUFFIX}+fulldebug
.endif

MAN3=		gc.3

.if ${ARCH} == "ia64"
BROKEN=		"Does not compile on ia64"
.endif

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/doc/gc.man

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/gc.man ${PREFIX}/man/man3/gc.3

.include <bsd.port.post.mk>
