# New ports collection makefile for:	xvid
# Date created:		04 April 2002
# Whom:			Michael Nottebrock <michaelnottebrock@gmx.net> et al
#
# $MidnightBSD: mports/multimedia/xvid/Makefile,v 1.3 2009/06/11 19:55:18 laffer1 Exp $
# $FreeBSD: ports/multimedia/xvid/Makefile,v 1.23 2006/06/26 16:21:35 lofi Exp $
#

PORTNAME=	xvid
PORTVERSION=	1.3.0
PORTEPOCH=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://downloads.xvid.org/downloads/
DISTNAME=	${PORTNAME}core-${PORTVERSION}

MAINTAINER=	ports@MidnighBSD.org
COMMENT=	An opensource MPEG-4 codec, based on OpenDivx
LICENSE=	gpl2

GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV+=	ac_cv_prog_ac_yasm=no

PLIST_FILES=	include/xvid.h \
		lib/libxvidcore.a \
		lib/libxvidcore.so \
		lib/libxvidcore.so.4

WRKSRC=		${WRKDIR}/xvidcore/build/generic

OPTIONS=	OPTIMIZED_CFLAGS "Use XviD's default optimizations" off

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd7.0
.endif
.if ${ARCH} == "amd64" || ${ARCH} == "i386"
BUILD_DEPENDS+=	nasm:${PORTSDIR}/devel/nasm
.endif

.if defined(WITH_OPTIMIZED_CFLAGS)
CFLAGS=		# let xvid's build system decide about those
.endif

post-install:
	@ ${LN} -sf ${PREFIX}/lib/libxvidcore.so.4 ${PREFIX}/lib/libxvidcore.so

.include <bsd.port.post.mk>
