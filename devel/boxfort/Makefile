PORTNAME=	boxfort
DISTVERSIONPREFIX=	v
DISTVERSION=	0.1.4
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convenient and cross-platform sandboxing C library
WWW=		https://github.com/Snaipe/BoxFort

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		meson
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	Snaipe
GH_PROJECT=	BoxFort

PLIST_FILES=	include/boxfort.h \
		lib/libboxfort.so \
		libdata/pkgconfig/boxfort.pc

.include <bsd.port.mk>
