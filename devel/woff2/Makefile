# $MidnightBSD$

PORTNAME=	woff2
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and converter tools for the WOFF 2.0 web font format

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libbrotlidec.so:archivers/brotli

USES=		cmake:outsource compiler:c++11-lib
USE_GITHUB=	yes
GH_ACCOUNT=	google
USE_LDCONFIG=	yes

PLIST_SUB=	SHLIBVER=${DISTVERSION}

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${CP} ${PREFIX}/lib/pkgconfig/*.pc ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
