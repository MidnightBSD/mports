# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	ots
PORTVERSION=	8.0.0
DISTVERSIONPREFIX=	v
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenType Sanitizer

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libbrotlidec.so:archivers/brotli \
		libfreetype.so:print/freetype2 \
		libgtest.so:devel/googletest \
		liblz4.so:archivers/liblz4 \
		libwoff2dec.so:devel/woff2

USES=		compiler:c++11-lang meson pkgconfig shebangfix

MESON_FALSE=	debug
MESON_TRUE=	graphite

GH_ACCOUNT=	khaledhosny
USE_GITHUB=	yes

SHEBANG_FILES=	tests/*.sh
bash_CMD=	${SH}

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/meson.build

.include <bsd.port.mk>
