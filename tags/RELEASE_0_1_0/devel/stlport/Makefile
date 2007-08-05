# ex:ts=8
# Ports collection makefile for:  stlport
# Date Created:			  2 December 1998
# Whom:				  Josh Gilliam <josh@quick.net>
#
# $MidnightBSD: mports/devel/stlport/Makefile,v 1.1 2007/01/02 00:38:33 laffer1 Exp $

PORTNAME=	stlport
PORTVERSION=	4.6.2
PORTREVISION?=	0
CATEGORIES=	devel
MASTER_SITES=	http://www.stlport.com/archive/
PKGNAMESUFFIX=	-${COMPILER}
DISTNAME=	STLport-${PORTVERSION:S/.b/-b/}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Adaptation of SGI's Standard Template Library

.include <bsd.port.pre.mk>

.if !exists(/usr/include/wchar.h)
BROKEN=		"Requires /usr/include/wchar.h for compilation"
.endif

WRKSRC=		${WRKDIR}/STLport-${PORTVERSION:S/.b/b/}/src
PATCH_WRKSRC=	${WRKDIR}/STLport-${PORTVERSION:S/.b/b/}
USE_GMAKE=	yes
COMPILER?=	gcc
MAKEFILE=	${COMPILER}-freebsd.mak
MAKE_ENV+=	CC=${CC} CXX=${CXX}
MAKE_ARGS+=	INSTALLDIR=${PREFIX} PTHREAD_CFLAGS=${PTHREAD_CFLAGS} \
		PTHREAD_LIBS=${PTHREAD_LIBS}
PLIST_SUB+=	COMPILER=${COMPILER}

INSTALL_TARGET=	install_unix
FAKE_MAKEARGS+=	INSTALLDIR=${FAKE_DESTDIR}${PREFIX}
USE_LDCONFIG=	yes

.if ${COMPILER} == icc
CC=		icc
CXX=		icpc
CFLAGS=		-O -ip -axiMKW
CXXFLAGS=	${CFLAGS}
.else
# There's segfault on -current if you use non default CFLAGS.
CFLAGS=		-O -pipe
CXXFLAGS=	${CFLAGS}
.endif

.if ${COMPILER} == gcc 
pre-everything::
	@${ECHO_MSG}
	@${ECHO_MSG} "If you have encounted a compiler internal error"
	@${ECHO_MSG} "during building, do NOT 'make clean', simply continue"
	@${ECHO_MSG} "building by type 'make ${.TARGET}' again."
	@${ECHO_MSG}
.endif

post-patch:
	@${CP} ${FILESDIR}/src::icc-freebsd.mak ${WRKSRC}/icc-freebsd.mak
	@${CP} ${FILESDIR}/stlport::stl_icc.h \
		${WRKSRC}/../stlport/config/stl_icc.h
	@${CP} ${FILESDIR}/test::eh::icc-freebsd.mak \
		${WRKSRC}/../test/eh/icc-freebsd.mak

post-install:
	${FIND} ${PREFIX}/include/stlport -name \*.orig -delete
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/images
	${INSTALL_DATA} ${WRKSRC}/../doc/*.css ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/../doc/*.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/../doc/images/* ${DOCSDIR}/images
.endif

post-build:	test

test:	do-build
	@cd ${WRKSRC}/../test/eh && ${SETENV} ${MAKE_ENV} \
		${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check_d

.include <bsd.port.post.mk>
