PORTNAME=	filmcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.13.0
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video editor and command-line tools
WWW=		https://github.com/storytold/filmcraft

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

BUILD_DEPENDS=	cmake:devel/cmake-core \
		rust>=1.95.0:lang/rust
LIB_DEPENDS=	libasound.so:audio/alsa-lib \
		libfontconfig.so:x11-fonts/fontconfig \
		libvulkan.so:graphics/vulkan-loader \
		libwayland-client.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon
RUN_DEPENDS=	xdg-open:devel/xdg-utils \
		zenity:x11/zenity

USES=		cargo desktop-file-utils gl gnome pkgconfig shared-mime-info xorg
USE_GL=		egl
USE_GNOME=	gtk-update-icon-cache
USE_XORG=	x11 xcb xcursor xi xrandr
INSTALLS_ICONS=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	storytold
GH_PROJECT=	filmcraft craft-fonts:fonts
GH_TAGNAME=	v0.13.0 bfcbf714e45a3ea8e98f88ab2b7971372a576414:fonts

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILD_ARGS=	-p filmcraft -p filmcraft-cli
CARGO_TEST_ARGS=	-p filmcraft -p filmcraft-cli
CARGO_BUILDDEP=	no
CARGO_ENV+=	CRAFT_FONTS_DIR=${WRKSRC_fonts} CRAFT_FONTS_REQUIRED=1 \
		FILMCRAFT_BUILD_SHA=30536bc5d0ddf690f2181b7b97182db8658a6038
CARGO_INSTALL=	no
EGUI_FONTS_DIR=	${CARGO_VENDOR_DIR}/epaint_default_fonts-0.36.2/fonts

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/filmcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/filmcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor \
		${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.filmcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.filmcraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.filmcraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-25/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.filmcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.filmcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${WRKSRC}/NOTICE \
		${WRKSRC}/ATTRIBUTION.md ${WRKSRC}/assets/app-icon/LICENSE.txt \
		${WRKSRC}/assets/fonts/OFL-Inter.txt \
		${WRKSRC}/assets/fonts/OFL-JetBrainsMono.txt \
		${WRKSRC}/assets/fonts/OFL-NotoSerif.txt \
		${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC_fonts}/ATTRIBUTION.md \
		${DOCSDIR}/ATTRIBUTION-craft-fonts.md
	for f in ${WRKSRC_fonts}/fonts/*/OFL.txt; do \
		${INSTALL_DATA} "$$f" ${DOCSDIR}/OFL-$$(basename $$(dirname "$$f")).txt; \
	done
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/UFL.txt \
		${EGUI_FONTS_DIR}/Hack-Regular.txt \
		${EGUI_FONTS_DIR}/emoji-icon-font-mit-license.txt ${DOCSDIR}/
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/OFL.txt ${DOCSDIR}/OFL-egui.txt
	${INSTALL_DATA} ${WRKSRC}/docs/brand/LICENSE-brand.txt ${DOCSDIR}/
	${INSTALL_DATA} ${FILESDIR}/LICENSE-MPL20.txt \
		${FILESDIR}/NOTICE-Symphonia.txt ${DOCSDIR}/

.include <bsd.port.mk>
