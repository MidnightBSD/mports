PORTNAME=	cmocka
DISTVERSION=	2.0.2
CATEGORIES=	sysutils
MASTER_SITES=	https://cmocka.org/files/1.1/ \
		FREEBSD_LOCAL/dteske

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unit testing framework for C with support for mock objects
WWW=		https://cmocka.org/

LICENSE=	Apache-2.0

USES=		cmake tar:xz
USE_LDCONFIG=	yes

PLIST_FILES=	include/cmocka.h \
		include/cmocka_pbc.h \
		include/cmocka_version.h \
		lib/cmake/cmocka/cmocka-config-version.cmake \
		lib/cmake/cmocka/cmocka-config.cmake \
		lib/cmake/cmocka/cmocka-targets-release.cmake \
		lib/cmake/cmocka/cmocka-targets.cmake \
		lib/libcmocka.so \
		lib/libcmocka.so.0 \
		lib/libcmocka.so.1.0.2 \
		libdata/pkgconfig/cmocka.pc

OPTIONS_DEFINE=	STATIC

STATIC_CMAKE_BOOL=	WITH_STATIC_LIB
STATIC_PLIST_FILES=	lib/libcmocka.a

post-install-STATIC-on:
		@${MV} "${FAKE_DESTDIR}${PREFIX}/lib/libcmocka-static.a" "${FAKE_DESTDIR}${PREFIX}/lib/libcmocka.a"

.include <bsd.port.mk>
