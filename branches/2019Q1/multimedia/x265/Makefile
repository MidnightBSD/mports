# $MidnightBSD$
# $FreeBSD: head/multimedia/x265/Makefile 412348 2016-04-01 14:16:16Z mat $

PORTNAME=	x265
PORTVERSION=	1.9
CATEGORIES=	multimedia
MASTER_SITES=	http://bitbucket.org/multicoreware/${PORTNAME}/get/
DISTNAME=	${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	H.265/High Efficiency Video Coding (HEVC) format

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/../COPYING

BUILD_DEPENDS=	yasm:${PORTSDIR}/devel/yasm

USES=		cmake pathfix tar:bzip2
USE_LDCONFIG=	yes
CMAKE_ARGS=	-DENABLE_TESTS=on -DPLATFORM_LIBS=md
EXTRACT_AFTER_ARGS+=	--exclude "md5*"

WRKSRC=		${WRKDIR}/multicoreware-${PORTNAME}-1d3b6e448e01/source

do-test:
	${WRKSRC}/test/TestBench

post-install:
	-${CP} ${PREFIX}/lib/pkgconfig/x265.pc ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
