PORTNAME=	xcb-imdkit
DISTVERSION=	1.0.9
CATEGORIES=	x11 textproc
MASTER_SITES=	https://download.fcitx-im.org/fcitx5/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Input method development support for XCB
WWW=		https://github.com/fcitx/xcb-imdkit

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSES/LGPL-2.1-only.txt

BUILD_DEPENDS=	uthash>=0:devel/uthash
LIB_DEPENDS=	libxcb-keysyms.so:x11/xcb-util-keysyms \
		libxcb-util.so:x11/xcb-util

USES=		cmake compiler:c11 kde:5 pkgconfig tar:zstd xorg

USE_KDE=	ecm
USE_XORG=	xcb

CMAKE_ON=	SYSTEM_USE_UTHASH

PLIST_SUB=	VER=${PORTVERSION}

.include <bsd.port.mk>
