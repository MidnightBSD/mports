PORTNAME=	qpdf
DISTVERSION=	11.9.1
CATEGORIES=	print
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line tools for transforming and inspecting PDF documents
WWW=		http://qpdf.sourceforge.net

LICENSE=	artistic2 Apache-2.0
LICENSE_COMB=	dual
LICENSE_FILE_artistic2=	${WRKSRC}/Artistic-2.0
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.txt

USES=		compiler:c++11-lang cmake cpe jpeg localbase
USE_LDCONFIG=	yes
CPE_VENDOR=	qpdf_project

CMAKE_ARGS=	-DHAVE_EXTERN_LONG_TIMEZONE=0 \
		-DBUILD_STATIC_LIBS=0 \
		-DUSE_IMPLICIT_CRYPTO=0 \
		-DALLOW_CRYPTO_NATIVE=0 \
		-DCMAKE_INSTALL_MANDIR=${PREFIX}/share/man
LDFLAGS=	-Wl,--undefined-version

OPTIONS_DEFINE=		DOCS
OPTIONS_RADIO=		CRYPTO
OPTIONS_RADIO_CRYPTO=	GNUTLS OPENSSL
OPTIONS_DEFAULT=	OPENSSL

OPENSSL_USES=		ssl
OPENSSL_CMAKE_BOOL=	REQUIRE_CRYPTO_OPENSSL

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
GNUTLS_CMAKE_BOOL=	REQUIRE_CRYPTO_GNUTLS

.include <bsd.port.mk>
