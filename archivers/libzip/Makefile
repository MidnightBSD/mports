PORTNAME=	libzip
DISTVERSION=	1.10.1
CATEGORIES=	archivers devel
MASTER_SITES=	https://github.com/nih-at/${PORTNAME}/releases/download/v${DISTVERSION}/ \
		https://libzip.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for reading, creating, and modifying ZIP archives
WWW=		https://libzip.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=		cmake cpe pathfix ssl tar:xz
CPE_VENDOR=	nih
USE_LDCONFIG=	yes

CMAKE_OFF=	BUILD_REGRESS ENABLE_COMMONCRYPTO ENABLE_GNUTLS ENABLE_MBEDTLS
CMAKE_ON=	CMAKE_SKIP_RPATH

CMAKE_ARGS=	-DCMAKE_INSTALL_MANDIR:PATH=${PREFIX}/share/man

.include <bsd.port.mk>
