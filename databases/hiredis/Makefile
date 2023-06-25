PORTNAME=	hiredis
PORTVERSION=	1.0.2
DISTVERSIONPREFIX=v
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Minimalistic C client library for the Redis database
WWW=		https://github.com/redis/hiredis

LICENSE=	bsd3

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	redis

USES=		cpe gmake
USE_LDCONFIG=	yes

CPE_VENDOR=	redislabs

OPTIONS_DEFINE=		OPENSSL
OPTIONS_DEFAULT=	OPENSSL
OPENSSL_MAKE_ARGS=	USE_SSL=1

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} \
		-e 's|\$$(INSTALL_LIBRARY_PATH)/\$$(PKGCONF_PATH)|\$$(DESTDIR)\$$(PREFIX)/libdata/\$$(PKGCONF_PATH)|' \
		${WRKSRC}/Makefile

post-build:
	@${STRIP_CMD} ${WRKSRC}/libhiredis.so

.include <bsd.port.mk>
