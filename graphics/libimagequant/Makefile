PORTNAME=	libimagequant
PORTVERSION=	4.2.1
PORTREVISION=	1
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image Quantization Library
WWW=		https://pngquant.org/lib/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

BUILD_DEPENDS=	cargo-cbuild:devel/cargo-c

USES=		cargo
USE_GITHUB=	yes
USE_LDCONFIG=	yes
GH_ACCOUNT=	ImageOptim
CARGO_BUILD_ARGS=	--package imagequant-sys
CARGO_INSTALL_ARGS:=	${CARGO_BUILD_ARGS}
PLIST_FILES=	include/libimagequant.h \
		lib/libimagequant.a \
		lib/libimagequant.so \
		lib/libimagequant.so.0.0.0 \
		libdata/pkgconfig/imagequant.pc

do-build:
	@${CARGO_CARGO_RUN} cbuild \
		--verbose \
		--verbose \
		${CARGO_BUILD_ARGS}

do-install:
	@${CARGO_CARGO_RUN} cinstall \
		--verbose \
		--verbose \
		--destdir "${FAKE_DESTDIR}" \
		--prefix "${TRUE_PREFIX}" \
		${CARGO_INSTALL_ARGS}
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/*.so

.include <bsd.port.mk>
