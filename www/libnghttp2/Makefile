PORTNAME=	nghttp2
PORTVERSION=	1.40.0
DISTVERSIONPREFIX=	v
CATEGORIES=	www net
PKGNAMEPREFIX=	lib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP/2.0 C Library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf compiler:c++14-lang libtool pathfix pkgconfig

CONFIGURE_ARGS=	--enable-lib-only
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_CXXSTD=	c++14
USE_LDCONFIG=	yes

USE_GITHUB=	yes

.include <bsd.port.mk>
