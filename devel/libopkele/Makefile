PORTNAME=	libopkele
PORTVERSION=	2.0.4
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://kin.klever.net/dist/

PATCH_SITES=	https://github.com/hacker/libopkele/commit/
PATCHFILES=	62f3ba4ecb92.diff:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ implementation of an OpenID decentralized identity system
WWW=		https://kin.klever.net/libopkele/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/include/boost/shared_ptr.hpp:devel/boost-libs
RUN_DEPENDS=	${LOCALBASE}/include/boost/shared_ptr.hpp:devel/boost-libs
LIB_DEPENDS=	libcurl.so:ftp/curl \
		libpcre.so:devel/pcre \
		libexpat.so:textproc/expat2 \
		libtidy.so:www/tidy-lib \
		libxslt.so:textproc/libxslt

USES=		gmake libtool localbase:ldflags pathfix \
		pkgconfig ssl
USE_CXXSTD=	c++14
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	OPENSSL_CFLAGS="-I${OPENSSLINC}" \
		OPENSSL_LIBS="-L${OPENSSLLIB} -lcrypto"

post-patch:
	@${REINPLACE_CMD} -e "/^Requires:/s,openssl ,," \
		${WRKSRC}/libopkele.pc.in

.include <bsd.port.mk>
