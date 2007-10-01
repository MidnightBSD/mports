# New ports collection makefile for:	xvid
# Date created:		04 April 2002
# Whom:			Michael Nottebrock <michaelnottebrock@gmx.net> et al
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/xvid/Makefile,v 1.23 2006/06/26 16:21:35 lofi Exp $
#

PORTNAME=	xvid
PORTVERSION=	1.1.0
PORTEPOCH=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://downloads.xvid.org/downloads/
DISTNAME=	${PORTNAME}core-${PORTVERSION}

MAINTAINER=	ports@MidnighBSD.org
COMMENT=	An opensource MPEG-4 codec, based on OpenDivx

BUILD_DEPENDS=	${LOCALBASE}/bin/nasm:${PORTSDIR}/devel/nasm

GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes
USE_GCC?=	3.4

WRKSRC=			${WRKDIR}/${DISTNAME}/build/generic

OPTIONS=	OPTIMIZED_CFLAGS "Use XviD's default optimizations" off

.include <bsd.port.pre.mk>

.if defined(WITH_OPTIMIZED_CFLAGS)
CFLAGS=		# let xvid's build system decide about those
.endif

post-install:
	@ ${LN} -sf ${PREFIX}/lib/libxvidcore.so.4 ${PREFIX}/lib/libxvidcore.so

.include <bsd.port.post.mk>
