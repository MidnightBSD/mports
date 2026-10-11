PORTNAME=	photocraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.5.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Layered photo editor and command-line tools
WWW=		https://github.com/storytold/photocraft

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

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILD_ARGS=	-p photocraft -p photocraft-cli --features heif
CARGO_TEST_ARGS=	-p photocraft -p photocraft-cli --features heif
CARGO_BUILDDEP=	no
CARGO_ENV+=	PHOTOCRAFT_BUILD_SHA=e5e3e397523b4db6a016dd19526e4c68514fcc72
CARGO_INSTALL=	no

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/photocraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/photocraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor \
		${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.photocraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.photocraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.photocraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-08/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.photocraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.photocraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${WRKSRC}/NOTICE ${WRKSRC}/ATTRIBUTION.md \
		${WRKSRC}/assets/app-icon/LICENSE.txt \
		${WRKSRC}/assets/dict/LICENSE-SCOWL.txt \
		${WRKSRC}/assets/fonts/OFL-Inter.txt \
		${WRKSRC}/assets/fonts/OFL-JetBrainsMono.txt \
		${WRKSRC}/assets/icons/LICENSE-lucide.txt \
		${WRKSRC}/assets/icons/LICENSE-noun-magnetic-lasso.txt \
		${DOCSDIR}/

.include <bsd.port.mk>
