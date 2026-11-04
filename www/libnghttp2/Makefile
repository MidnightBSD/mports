PORTNAME=	nghttp2
PORTVERSION=	1.68.0
CATEGORIES=	www net
MASTER_SITES=	https://github.com/nghttp2/nghttp2/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	lib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP/2 C Library
WWW=		https://nghttp2.org/ \
		https://github.com/nghttp2/nghttp2

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe libtool pkgconfig tar:xz

CONFIGURE_ARGS=	--enable-lib-only
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

.include <bsd.port.mk>
