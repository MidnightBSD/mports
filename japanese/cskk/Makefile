PORTNAME=	cskk
DISTVERSIONPREFIX=	v
DISTVERSION=	3.2.0
CATEGORIES=	japanese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SKK (Simple Kana Kanji henkan) library
WWW=		https://github.com/naokiri/cskk

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	cargo-cbuild:devel/cargo-c
LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon

USES=		cargo localbase:ldflags
USE_GITHUB=	yes
GH_ACCOUNT=	naokiri

USE_LDCONFIG=	${PREFIX}/lib/cskk

PLIST_SUB=	VERSION=${DISTVERSION} \
		VERSION_MAJOR=${DISTVERSION:R:R}

do-build:
	@${CARGO_CARGO_RUN} cbuild ${CARGO_BUILD_ARGS}

do-install:
	@${CARGO_CARGO_RUN} cinstall \
		--destdir "${FAKE_DESTDIR}" \
		--prefix "${TRUE_PREFIX}" \
		--pkgconfigdir "${TRUE_PREFIX}/libdata/pkgconfig" \
		${CARGO_INSTALL_ARGS}

.include <bsd.port.mk>
