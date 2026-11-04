PORTNAME=	vectorcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.17.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vector illustration editor and command-line tools
WWW=		https://github.com/storytold/vectorcraft

LICENSE=	mit OFL11 iscl UFL BitstreamVera bsd3 CC0-1.0 IJG
LICENSE_COMB=	multi
LICENSE_NAME_UFL=	Ubuntu Font Licence 1.0
LICENSE_NAME_BitstreamVera=	Bitstream Vera Font License
LICENSE_NAME_IJG=	Independent JPEG Group License
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_OFL11=	${WRKSRC}/assets/fonts/OFL-Inter.txt
LICENSE_FILE_iscl=	${WRKSRC}/assets/icons/LICENSE-lucide.txt
LICENSE_FILE_UFL=	${EGUI_FONTS_DIR}/UFL.txt
LICENSE_FILE_BitstreamVera=	${EGUI_FONTS_DIR}/Hack-Regular.txt
LICENSE_FILE_bsd3=	${WRKSRC}/licenses/pdf-backend/hayro-cmap/LICENSE.txt
LICENSE_FILE_CC0-1.0=	${WRKSRC}/licenses/pdf-backend/hayro-interpret/assets/CGATS_LICENSE.txt
LICENSE_FILE_IJG=	${FILESDIR}/LICENSE-IJG
LICENSE_PERMS_UFL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_BitstreamVera=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_IJG=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

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
EGUI_FONTS_DIR=	${CARGO_VENDOR_DIR}/epaint_default_fonts-0.36.2/fonts

post-patch:
	${REINPLACE_CMD} -e 's|"/etc/fonts/fonts.conf"|"${LOCALBASE}/etc/fonts/fonts.conf"|g' \
		${WRKSRC}/crates/text/src/fontconfig.rs

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/vectorcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/vectorcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.vectorcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.vectorcraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.vectorcraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-25/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.vectorcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.vectorcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)

	${MKDIR} ${DOCSDIR}/licenses
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/Hack-Regular.txt \
		${EGUI_FONTS_DIR}/UFL.txt \
		${EGUI_FONTS_DIR}/emoji-icon-font-mit-license.txt ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/OFL.txt \
		${DOCSDIR}/licenses/OFL-NotoEmoji.txt
	${INSTALL_DATA} ${FILESDIR}/LICENSE-IJG ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/NOTICE \
		${WRKSRC}/LICENSE-MIT ${WRKSRC}/LICENSE-APACHE \
		${WRKSRC}/ASSETS.md ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/assets/fonts/OFL-*.txt \
		${WRKSRC}/assets/icons/LICENSE-lucide.txt ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${WRKSRC}/assets/app-icon/LICENSE.txt \
		${DOCSDIR}/licenses/LICENSE-app-icon.txt
	${INSTALL_DATA} ${WRKSRC}/licenses/pdf-backend/hayro-interpret/assets/CGATS_LICENSE.txt \
		${WRKSRC}/licenses/pdf-backend/hayro-interpret/assets/LICENSE_FOXIT \
		${DOCSDIR}/licenses/
	${INSTALL_DATA} ${WRKSRC}/licenses/pdf-backend/hayro-cmap/LICENSE.txt \
		${DOCSDIR}/licenses/LICENSE-CMap.txt

.include <bsd.port.mk>
