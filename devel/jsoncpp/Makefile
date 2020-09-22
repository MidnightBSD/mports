# Created by: Johan Str??m <johan@stromnet.se>

PORTNAME=	jsoncpp
PORTVERSION=	1.9.2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON reader and writer library for C++

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c++14-lang meson pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	open-source-parsers
MESON_ARGS=	--default-library=both
USE_LDCONFIG=	yes

NO_TEST=	yes

.include <bsd.port.mk>
