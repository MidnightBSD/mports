# Created by: John Marino <marino@FreeBSD.org>

PORTNAME=	zstd
PORTVERSION=	1.4.5
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/facebook/zstd/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast real-time compression algorithm

LICENSE=	bsd3 gpl2
LICENSE_COMB=	dual

TEST_DEPENDS=	gmd5sum:sysutils/coreutils

USES=		meson pkgconfig python:3.4+,build shebangfix

MESON_ARGS=	-Ddefault_library=both
USE_LDCONFIG=	yes
WRKSRC_SUBDIR=	build/meson

SHEBANG_FILES=	*.py

PLIST_SUB=	PORTVERSION=${PORTVERSION}

OPTIONS_DEFINE=	LZ4 OPTIMIZED_CFLAGS TEST
OPTIONS_DEFAULT=LZ4

LZ4_LIB_DEPENDS=	liblz4.so:archivers/liblz4
LZ4_MESON_ENABLED=	lz4
LZ4_USES=		localbase:ldflags
OPTIMIZED_CFLAGS_VARS=	CFLAGS+=-O3
TEST_MESON_TRUE=	bin_tests

.include <bsd.port.mk>
