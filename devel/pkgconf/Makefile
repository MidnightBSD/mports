# $MidnightBSD$

PORTNAME=	pkgconf
PORTVERSION=	1.5.3
CATEGORIES=	devel
MASTER_SITES=	https://distfiles.dereferenced.org/pkgconf/ \
		http://files.etoilebsd.net/pkgconf/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to help to configure compiler and linker flags

LICENSE=	iscl

USES=		tar:xz libtool pathfix
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
TEST_TARGET=	check
CONFIGURE_ARGS=	--with-pkg-config-dir=${PREFIX}/libdata/pkgconfig:${PREFIX}/lib/pkgconfig:/usr/libdata/pkgconfig \
		--with-system-libdir=/usr/lib \
		--with-system-includedir=/usr/include
MAKE_ARGS=	MANDIR="${MAN1PREFIX}/man/man1"

post-install:
	${LN} -sf pkgconf ${STAGEDIR}${PREFIX}/bin/pkg-config

.include <bsd.port.mk>
