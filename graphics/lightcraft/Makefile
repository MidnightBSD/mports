PORTNAME=	lightcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.14.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Photo library and raw development application
WWW=		https://github.com/storytold/lightcraft

LICENSE=	mit Apache-2.0 OFL11 CC-BY-4.0 UFL BitstreamVera IJG
LICENSE_COMB=	multi
LICENSE_NAME_UFL=	Ubuntu Font Licence 1.0
LICENSE_NAME_BitstreamVera=	Bitstream Vera Font License
LICENSE_NAME_IJG=	Independent JPEG Group License
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_OFL11=	${WRKSRC}/assets/fonts/OFL-Inter.txt
LICENSE_FILE_CC-BY-4.0=	${FILESDIR}/LICENSE-CC-BY-4.0
LICENSE_FILE_UFL=	${EGUI_FONTS_DIR}/UFL.txt
LICENSE_FILE_BitstreamVera=	${EGUI_FONTS_DIR}/Hack-Regular.txt
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
GH_PROJECT=	lightcraft craft-fonts:fonts
GH_TAGNAME=	v${DISTVERSION} a71c20e30af613287c504f7e685ca8fad77752bc:fonts

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILD_ARGS=	-p lightcraft -p lightcraft-cli \
		--features lightcraft/heif,lightcraft-cli/heif
CARGO_TEST_ARGS=	-p lightcraft -p lightcraft-cli \
		--features lightcraft/heif,lightcraft-cli/heif
CARGO_BUILDDEP=	no
CARGO_ENV+=	CRAFT_FONTS_DIR=${WRKSRC_fonts} CRAFT_FONTS_REQUIRED=1 \
		LIGHTCRAFT_BUILD_SHA=03c88c166c054c009db2a47187d59991f6232b85
CARGO_INSTALL=	no
EGUI_FONTS_DIR=	${CARGO_VENDOR_DIR}/epaint_default_fonts-0.36.2/fonts

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/lightcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/lightcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor \
		${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.lightcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.lightcraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.lightcraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-25/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.lightcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.lightcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${WRKSRC}/NOTICE \
		${WRKSRC}/assets/ATTRIBUTION.md \
		${WRKSRC}/assets/fonts/OFL-Inter.txt \
		${WRKSRC}/assets/app-icon/LICENSE.txt \
		${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC_fonts}/ATTRIBUTION.md \
		${DOCSDIR}/ATTRIBUTION-craft-fonts.md
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/biz-ud-mincho/OFL.txt \
		${DOCSDIR}/OFL-biz-ud-mincho.txt
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/biz-ud-pgothic/OFL.txt \
		${DOCSDIR}/OFL-biz-ud-pgothic.txt
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/noto-sans-arabic/OFL.txt \
		${DOCSDIR}/OFL-noto-sans-arabic.txt
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/noto-sans-cjk-sc/OFL.txt \
		${DOCSDIR}/OFL-noto-sans-cjk-sc.txt
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/shippori-mincho/OFL.txt \
		${DOCSDIR}/OFL-shippori-mincho.txt

	${MKDIR} ${DOCSDIR}/licenses
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/Hack-Regular.txt \
		${EGUI_FONTS_DIR}/UFL.txt \
		${EGUI_FONTS_DIR}/emoji-icon-font-mit-license.txt ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/OFL.txt \
		${DOCSDIR}/licenses/OFL-NotoEmoji.txt
	${INSTALL_DATA} ${FILESDIR}/LICENSE-IJG ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${FILESDIR}/LICENSE-CC-BY-4.0 ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/noto-sans-thai/OFL.txt \
		${DOCSDIR}/OFL-noto-sans-thai.txt
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/noto-sans-georgian/OFL.txt \
		${DOCSDIR}/OFL-noto-sans-georgian.txt

.include <bsd.port.mk>
