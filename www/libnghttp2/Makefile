PORTNAME=	nghttp2
PORTVERSION=	1.59.0
CATEGORIES=	www net
MASTER_SITES=	https://github.com/nghttp2/nghttp2/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	lib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP/2.0 C Library
WWW=		https://nghttp2.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

# should be c++14 but that breaks curl -> cmake -> llvm so we have a loop
USES=		autoreconf cpe compiler:c++11-lang libtool pathfix pkgconfig tar:xz

CONFIGURE_ARGS=	--enable-lib-only
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
#USE_CXXSTD=	c++14
USE_LDCONFIG=	yes

.include <bsd.port.mk>
