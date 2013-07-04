# $MidnightBSD$
# $FreeBSD: ports/math/eigen2/Makefile,v 1.14 2010/08/03 17:51:23 makc Exp $

PORTNAME=	eigen
PORTVERSION=	2.0.15
CATEGORIES=	math
MASTER_SITES=	http://bitbucket.org/eigen/eigen/get/
DISTNAME=	${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight library for vector and matrix math
LICENSE=	gpl3

USE_BZIP2=	yes
USE_CMAKE=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

post-patch:
	@${REINPLACE_CMD} -e 's|share/pkgconfig|libdata/pkgconfig|g' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
