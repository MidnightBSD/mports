PORTNAME=	http-parser
PORTVERSION=	2.9.4
DISTVERSIONPREFIX=	v
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP request/response parser written in C
WWW=		https://github.com/nodejs/http-parser

LICENSE=	mit

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	nodejs

USES=		gmake
USE_LDCONFIG=	yes
MAKE_ENV=	STRIP="${STRIP}"
ALL_TARGET=	library
INSTALL_TARGET=	install-strip
TEST_TARGET=	test

PLIST_FILES=	include/http_parser.h lib/libhttp_parser.so \
		lib/libhttp_parser.so.${PORTVERSION:R} \
		lib/libhttp_parser.so.${PORTVERSION}

.include <bsd.port.mk>
