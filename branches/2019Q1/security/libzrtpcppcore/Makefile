# $MidnightBSD$
# $FreeBSD: head/security/libzrtpcppcore/Makefile 376798 2015-01-11 19:25:27Z tijl $

PORTNAME=	libzrtpcppcore
DISTVERSIONPREFIX=	V
DISTVERSION=	4.3.1
CATEGORIES=	security
MASTER_SITES=	GHR

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU ZRTP library

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	wernerd
GH_PROJECT=	ZRTPCPP
WRKSRC=		${WRKDIR}/${GH_PROJECT}-${DISTVERSION}

USES=		cmake:outsource,noninja compiler:c++11-lib
USE_CXXSTD=	c++11
CMAKE_ARGS=	-DCORE_LIB:BOOL=ON
USE_LDCONFIG=	yes

.include <bsd.port.mk>
