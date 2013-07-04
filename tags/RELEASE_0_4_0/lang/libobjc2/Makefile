# $MidnightBSD: mports/lang/libobjc2/Makefile,v 1.1 2013/01/26 16:02:16 laffer1 Exp $

PORTNAME=	libobjc2
PORTVERSION=	1.6
PORTREVISION=	1
CATEGORIES=	lang devel gnustep
MASTER_SITES=	http://download.gna.org/gnustep/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Replacement Objective-C runtime supporting Obj-C 2 features
LICENSE=	mit

BUILD_DEPENDS=	${LOCALBASE}/bin/as:${PORTSDIR}/devel/binutils

USE_BZIP2=	yes
USE_LDCONFIG=	yes
MAKE_ENV+=	LD=${LOCALBASE}/bin/ld
MAKE_ENV+=	SHLIB_VERSION="${SHLIB_VERSION}"
PLIST_SUB=	SHLIB=${SHLIB_VERSION}

OPTIONS_DEFINE=		NSOBJECT_ROOT
OPTIONS_DEFAULT=	NSOBJECT_ROOT
NSOBJECT_ROOT_DESC=	Root class is NSObject not Object

SHLIB_VERSION?=	16

.include <bsd.mport.options.mk>

MAKE_ARGS+=	-DWITHOUT_TOYDISPATCH

.if ${PORT_OPTIONS:MNSOBJECT_ROOT}
CPPFLAGS+=	-DGNUSTEP
.endif

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4015
.if defined(CC) && ${CC:T:Mclang}
# all done
.else
# force clang
CC=	${LOCALBASE}/bin/clang
BUILD_DEPENDS+=	${LOCALBASE}/bin/clang:${PORTSDIR}/lang/clang
.endif
.endif

.if (${ARCH} == i386) || (${ARCH} == i486)
CFLAGS+=	-march=i586
.endif

post-patch:
	${RM} ${WRKSRC}/GNUmakefile

post-install:
	${RM} ${PREFIX}/include/objc/toydispatch.h

.include <bsd.port.post.mk>
