PORTNAME=	libyang
PORTVERSION=	2.1.128
DISTVERSIONPREFIX=	v
CATEGORIES=	net
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	YANG data modeling language library, version 2
WWW=		https://github.com/CESNET/libyang

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libpcre2-8.so:devel/pcre2
TEST_DEPENDS=	cmocka>0:sysutils/cmocka

USES=	cmake compiler:c++11-lang pkgconfig
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	CESNET

NO_TEST=	yes

.include <bsd.port.mk>
