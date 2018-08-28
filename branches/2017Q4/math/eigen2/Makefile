# $MidnightBSD$
# $FreeBSD: ports/math/eigen2/Makefile,v 1.14 2010/08/03 17:51:23 makc Exp $

PORTNAME=	eigen
PORTVERSION=	2.0.17
PORTREVISION=	1
CATEGORIES=	math
MASTER_SITES=	https://bitbucket.org/eigen/eigen/get/
DISTNAME=	${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight library for vector and matrix math

LICENSE=	gpl3

USES=		cmake tar:bzip2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTNAME}-b23437e61a07

post-patch:
	@${REINPLACE_CMD} -e 's|share/pkgconfig|libdata/pkgconfig|g' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
