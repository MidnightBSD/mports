PORTNAME=	ykclient
PORTVERSION=	2.15
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	https://developers.yubico.com/yubico-c-client/Releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yubico C client library
WWW=		https://developers.yubico.com/yubico-c-client/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcurl.so:ftp/curl
BUILD_DEPENDS=	curl-config:ftp/curl \
		help2man:misc/help2man

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
USES=		libtool pkgconfig
USE_LDCONFIG=	yes
TEST_TARGET=	check
NO_TEST=	yes

PLIST_FILES=	bin/ykclient \
		include/ykclient.h \
		include/ykclient_errors.h \
		include/ykclient_server_response.h \
		include/ykclient_version.h \
		lib/libykclient.so \
		lib/libykclient.so.3 \
		lib/libykclient.so.3.6.0 \
		share/man/man1/ykclient.1.gz

OPTIONS_DEFINE=	STATIC

STATIC_CONFIGURE_ENABLE=	static
STATIC_PLIST_FILES=		lib/libykclient.a

MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.mk>
