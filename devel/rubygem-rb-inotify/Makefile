PORTNAME=	rb-inotify
PORTVERSION=	0.11.1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby wrapper for libinotify, using ffi
WWW=		https://github.com/guard/rb-inotify

LICENSE=	mit

LIB_DEPENDS=	libinotify.so:devel/libinotify
BUILD_DEPENDS=	rubygem-ffi>=1.0<2:devel/rubygem-ffi
RUN_DEPENDS=	rubygem-ffi>=1.0<2:devel/rubygem-ffi

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
