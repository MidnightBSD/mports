PORTNAME=	vectorcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.9.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vector illustration editor and command-line tools
WWW=		https://github.com/storytold/vectorcraft

LICENSE=	mit Apache-2.0
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE

BUILD_DEPENDS=	cmake:devel/cmake-core \
		rust>=1.95.0:lang/rust
LIB_DEPENDS=	libasound.so:audio/alsa-lib \
		libfontconfig.so:x11-fonts/fontconfig \
		libvulkan.so:graphics/vulkan-loader \
		libwayland-client.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon

USES=		cargo desktop-file-utils gl pkgconfig shared-mime-info xorg
USE_GL=		egl
USE_XORG=	x11 xcb xcursor xi xrandr
USE_GITHUB=	yes
GH_ACCOUNT=	storytold

CARGO_BUILD_ARGS=	-p vectorcraft -p vectorcraft-cli
CARGO_TEST_ARGS=	-p vectorcraft -p vectorcraft-cli
CARGO_BUILDDEP=	no
CARGO_INSTALL=	no

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/vectorcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/vectorcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.vectorcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.vectorcraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.vectorcraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-11/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.vectorcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.vectorcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)

.include <bsd.port.mk>
