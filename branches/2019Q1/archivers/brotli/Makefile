# $MidnightBSD$

PORTNAME=	brotli
PORTVERSION=	1.0.6
DISTVERSIONPREFIX=	v
PORTEPOCH=	1
CATEGORIES=	archivers devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic-purpose lossless compression algorithm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	google

USES=		autoreconf:build compiler:c++0x gmake libtool pkgconfig
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

INSTALL_TARGET=	install-strip
PLIST_SUB=	SHLIBVER=${PORTVERSION}

OPTIONS_DEFINE=	DOCS

pre-configure:
	(cd ${WRKSRC} && ./bootstrap)

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig/
	${CP} ${PREFIX}/lib/pkgconfig/*.pc ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
