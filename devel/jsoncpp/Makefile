PORTNAME=	jsoncpp
DISTVERSION=	1.9.5
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON reader and writer library for C++
WWW=		https://github.com/open-source-parsers/jsoncpp

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c++11-lang cpe meson pkgconfig python:build,test
USE_GITHUB=	yes
GH_ACCOUNT=	open-source-parsers
MESON_ARGS=	--default-library=both
USE_LDCONFIG=	yes
CPE_VENDOR=	jsoncpp_project

NO_TEST=	yes

.include <bsd.port.mk>
