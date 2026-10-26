PORTNAME=	effectcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.17.0
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Motion graphics compositor and command-line tools
WWW=		https://github.com/storytold/effectcraft

LICENSE=	mit OFL11 ArtCraftBrand UFL BitstreamVera MPL20
LICENSE_COMB=	multi
LICENSE_NAME_ArtCraftBrand=	ArtCraft Brand Terms
LICENSE_NAME_UFL=	Ubuntu Font Licence 1.0
LICENSE_NAME_BitstreamVera=	Bitstream Vera Font License
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_OFL11=	${WRKSRC}/assets/fonts/OFL-Inter.txt
LICENSE_FILE_ArtCraftBrand=	${WRKSRC}/docs/brand/LICENSE-brand.txt
LICENSE_FILE_UFL=	${EGUI_FONTS_DIR}/UFL.txt
LICENSE_FILE_BitstreamVera=	${EGUI_FONTS_DIR}/Hack-Regular.txt
LICENSE_FILE_MPL20=	${FILESDIR}/LICENSE-MPL20.txt
LICENSE_PERMS_ArtCraftBrand=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept
LICENSE_PERMS_UFL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_BitstreamVera=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	Upstream FreeBSD build is tested only on x86_64

BUILD_DEPENDS=	cmake:devel/cmake-core \
		rust>=1.95:lang/rust
LIB_DEPENDS=	libasound.so:audio/alsa-lib \
		libfontconfig.so:x11-fonts/fontconfig \
		libvulkan.so:graphics/vulkan-loader \
		libwayland-client.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon

USES=		cargo desktop-file-utils gl gnome pkgconfig shared-mime-info xorg
USE_GL=		egl
USE_GNOME=	gtk30
USE_XORG=	x11 xcb xcursor xi xrandr
USE_GITHUB=	yes
GH_ACCOUNT=	storytold
INSTALLS_ICONS=	yes

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILDDEP=	no
CARGO_INSTALL=	no
EGUI_FONTS_DIR=	${CARGO_VENDOR_DIR}/epaint_default_fonts-0.36.2/fonts
CARGO_BUILD_ARGS=	-p effectcraft -p effectcraft-cli
CARGO_TEST_ARGS=	-p effectcraft -p effectcraft-cli
CARGO_ENV+=	CARGO_PROFILE_RELEASE_LTO=false \
		CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16 \
		EFFECTCRAFT_BUILD_SHA=362474a843ddb67555d4c2d19ad6a590388aad0e
WITHOUT_LTO=	yes

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/effectcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/effectcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.effectcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.effectcraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.effectcraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-25/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.effectcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.effectcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/NOTICE \
		${WRKSRC}/ATTRIBUTION.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${WRKSRC}/assets/app-icon/LICENSE.txt \
		${WRKSRC}/assets/fonts/OFL-Inter.txt \
		${WRKSRC}/assets/fonts/OFL-JetBrainsMono.txt \
		${WRKSRC}/assets/fonts/OFL-NotoSerif.txt \
		${WRKSRC}/docs/brand/LICENSE-brand.txt ${DOCSDIR}/
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/UFL.txt \
		${EGUI_FONTS_DIR}/Hack-Regular.txt \
		${EGUI_FONTS_DIR}/emoji-icon-font-mit-license.txt ${DOCSDIR}/
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/OFL.txt ${DOCSDIR}/OFL-egui.txt
	${INSTALL_DATA} ${FILESDIR}/LICENSE-MPL20.txt \
		${FILESDIR}/NOTICE-Symphonia.txt ${DOCSDIR}/

.include <bsd.port.mk>
