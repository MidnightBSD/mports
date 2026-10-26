PORTNAME=	photocraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.16.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Layered photo editor and command-line tools
WWW=		https://github.com/storytold/photocraft

LICENSE=	mit OFL11 iscl CC-BY-3.0 CC0-1.0 bsd3 SCOWL UFL BitstreamVera IJG
LICENSE_COMB=	multi
LICENSE_NAME_UFL=	Ubuntu Font Licence 1.0
LICENSE_NAME_BitstreamVera=	Bitstream Vera Font License
LICENSE_NAME_SCOWL=	SCOWL word list license
LICENSE_NAME_IJG=	Independent JPEG Group License
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_OFL11=	${WRKSRC}/assets/fonts/OFL-Inter.txt
LICENSE_FILE_iscl=	${WRKSRC}/assets/icons/LICENSE-lucide.txt
LICENSE_FILE_CC-BY-3.0=	${WRKSRC}/assets/icons/LICENSE-noun-magnetic-lasso.txt
LICENSE_FILE_CC0-1.0=	${FILESDIR}/LICENSE-CC0-1.0
LICENSE_FILE_bsd3=	${WRKSRC}/crates/algo/data/LICENSE-libfacedetection.txt
LICENSE_FILE_SCOWL=	${WRKSRC}/assets/dict/LICENSE-SCOWL.txt
LICENSE_FILE_UFL=	${EGUI_FONTS_DIR}/UFL.txt
LICENSE_FILE_BitstreamVera=	${EGUI_FONTS_DIR}/Hack-Regular.txt
LICENSE_FILE_IJG=	${FILESDIR}/LICENSE-IJG
LICENSE_PERMS_UFL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_BitstreamVera=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_SCOWL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
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

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILD_ARGS=	-p photocraft -p photocraft-cli --features heif
CARGO_TEST_ARGS=	-p photocraft -p photocraft-cli --features heif
CARGO_BUILDDEP=	no
CARGO_ENV+=	PHOTOCRAFT_BUILD_SHA=b1794c6e0608ccfc887213dcf58398977c5cb75e
CARGO_INSTALL=	no
EGUI_FONTS_DIR=	${CARGO_VENDOR_DIR}/epaint_default_fonts-0.36.2/fonts

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
		-e 's/@DATE@/2026-10-25/g' \
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
		${WRKSRC}/assets/icons/LICENSE-symmetry-axes.txt \
		${DOCSDIR}/

	${MKDIR} ${DOCSDIR}/licenses
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/Hack-Regular.txt \
		${EGUI_FONTS_DIR}/UFL.txt \
		${EGUI_FONTS_DIR}/emoji-icon-font-mit-license.txt ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/OFL.txt \
		${DOCSDIR}/licenses/OFL-NotoEmoji.txt
	${INSTALL_DATA} ${FILESDIR}/LICENSE-IJG ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${FILESDIR}/LICENSE-CC0-1.0 \
		${WRKSRC}/crates/algo/data/LICENSE-libfacedetection.txt \
		${DOCSDIR}/licenses/
	${INSTALL_DATA} ${FILESDIR}/LICENSE-X11-rgb \
		${WRKSRC}/crates/ui-egui/src/LICENSE-solarized.txt \
		${WRKSRC}/crates/ui-egui/src/i18n/LICENSE-translations.txt \
		${DOCSDIR}/licenses/

.include <bsd.port.mk>
