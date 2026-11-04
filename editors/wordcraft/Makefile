PORTNAME=	wordcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.11.0
CATEGORIES=	editors

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Word processor and document conversion tools
WWW=		https://github.com/storytold/wordcraft

LICENSE=	mit bsd3 OFL11 CC0-1.0 Unicode-3.0 UFL BitstreamVera
LICENSE_COMB=	multi
LICENSE_NAME_UFL=	Ubuntu Font Licence 1.0
LICENSE_NAME_BitstreamVera=	Bitstream Vera Font License
LICENSE_NAME_Unicode-3.0=	Unicode License V3
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_bsd3=	${WRKSRC}/assets/hyphenation/pt.pat
LICENSE_FILE_OFL11=	${WRKSRC}/assets/fonts/OFL-Inter.txt
LICENSE_FILE_CC0-1.0=	${WRKSRC_crate_craft-pdf}/licenses/pdf-writer/LICENSE-ICC.txt
LICENSE_FILE_Unicode-3.0=	${WRKSRC_crate_icu_decimal}/LICENSE
LICENSE_FILE_UFL=	${EGUI_FONTS_DIR}/UFL.txt
LICENSE_FILE_BitstreamVera=	${EGUI_FONTS_DIR}/Hack-Regular.txt
LICENSE_PERMS_Unicode-3.0=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_UFL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_BitstreamVera=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_DISTFILES_UFL=	rust/crates/epaint_default_fonts-0.36.2.crate
LICENSE_DISTFILES_BitstreamVera=	rust/crates/epaint_default_fonts-0.36.2.crate

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	Upstream FreeBSD build is tested only on x86_64

BUILD_DEPENDS=	rust>=1.95:lang/rust
LIB_DEPENDS=	libasound.so:audio/alsa-lib \
		libfontconfig.so:x11-fonts/fontconfig \
		libvulkan.so:graphics/vulkan-loader \
		libwayland-client.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon
RUN_DEPENDS=	xdg-open:devel/xdg-utils

USES=		cargo desktop-file-utils gl gnome pkgconfig shared-mime-info xorg
USE_GL=		egl
USE_GNOME=	gtk30
USE_XORG=	x11 xcb xcursor xi xrandr
USE_GITHUB=	yes
GH_ACCOUNT=	storytold
GH_TUPLE=	storytold:craft-i18n:04600cbb1508f1b15927ec574a5e32e5f376fd8b:i18n
INSTALLS_ICONS=	yes

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILDDEP=	no
CARGO_INSTALL=	no
CARGO_BUILD_ARGS=	-p wordcraft -p wordcraft-cli
CARGO_TEST_ARGS=	-p wordcraft -p wordcraft-cli
CARGO_ENV+=	CRAFT_I18N_DIR=${WRKSRC_i18n} \
		CRAFT_I18N_REQUIRED=1 \
		WORDCRAFT_BUILD_SHA=e31f2f06a5f8004ceaa88f68c00b47908e321aa4 \
		CARGO_PROFILE_RELEASE_LTO=false \
		CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16
EGUI_FONTS_DIR=	${CARGO_VENDOR_DIR}/epaint_default_fonts-0.36.2/fonts
WITHOUT_LTO=	yes

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/wordcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/wordcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.wordcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.wordcraft.mime.xml \
		${PREFIX}/share/mime/packages/
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-25/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.wordcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.wordcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/NOTICE \
		${WRKSRC}/ATTRIBUTION.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${WRKSRC}/assets/hyphenation/pt.pat \
		${WRKSRC}/assets/hyphenation/pl.pat \
		${WRKSRC}/assets/fonts/OFL-*.txt ${DOCSDIR}/

	${MKDIR} ${DOCSDIR}/licenses
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/Hack-Regular.txt \
		${EGUI_FONTS_DIR}/UFL.txt \
		${EGUI_FONTS_DIR}/emoji-icon-font-mit-license.txt ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/OFL.txt \
		${DOCSDIR}/licenses/OFL-NotoEmoji.txt

	${INSTALL_DATA} ${WRKSRC_crate_craft-pdf}/licenses/pdf-writer/LICENSE-ICC.txt \
		${DOCSDIR}/licenses/CC0-1.0.txt
	${INSTALL_DATA} ${WRKSRC_crate_icu_decimal}/LICENSE \
		${DOCSDIR}/licenses/Unicode-3.0.txt
	${INSTALL_DATA} ${WRKSRC_crate_craft-pdf}/NOTICE \
		${DOCSDIR}/licenses/NOTICE-craft-libs.txt

	${INSTALL_DATA} ${WRKSRC_crate_craft-pdf}/licenses/pdf-writer/LICENSE_MIT \
		${DOCSDIR}/licenses/LICENSE-krilla-MIT.txt
	${INSTALL_DATA} ${WRKSRC_crate_craft-pdf}/licenses/pdf-writer/LICENSE_APACHE \
		${DOCSDIR}/licenses/LICENSE-krilla-APACHE.txt

	${INSTALL_DATA} ${WRKSRC_i18n}/LICENSE-MIT \
		${DOCSDIR}/licenses/LICENSE-craft-i18n-MIT.txt
	${INSTALL_DATA} ${WRKSRC_i18n}/ATTRIBUTION.md \
		${DOCSDIR}/licenses/ATTRIBUTION-craft-i18n.md

.include <bsd.port.mk>
