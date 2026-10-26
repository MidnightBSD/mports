PORTNAME=	cadcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.13.0
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Computer-aided design and drafting application
WWW=		https://github.com/storytold/cadcraft

LICENSE=	mit OFL11 UFL BitstreamVera AcadrustMPL20 CC0-1.0
LICENSE_COMB=	multi
LICENSE_NAME_AcadrustMPL20=	acadrust MPL 2.0 variant
LICENSE_NAME_UFL=	Ubuntu Font Licence 1.0
LICENSE_NAME_BitstreamVera=	Bitstream Vera Font License
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_OFL11=	${EGUI_FONTS_DIR}/OFL.txt
LICENSE_FILE_UFL=	${EGUI_FONTS_DIR}/UFL.txt
LICENSE_FILE_BitstreamVera=	${EGUI_FONTS_DIR}/Hack-Regular.txt
LICENSE_FILE_AcadrustMPL20=	${FILESDIR}/LICENSE-acadrust.txt
LICENSE_FILE_CC0-1.0=	${WRKSRC_crate_krilla}/vendor/krilla/icc/LICENSE
LICENSE_PERMS_AcadrustMPL20=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_UFL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_BitstreamVera=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_DISTFILES_mit=	${DISTNAME}${EXTRACT_SUFX} \
		rust/crates/epaint_default_fonts-0.36.2.crate
LICENSE_DISTFILES_OFL11=	rust/crates/epaint_default_fonts-0.36.2.crate
LICENSE_DISTFILES_UFL=	rust/crates/epaint_default_fonts-0.36.2.crate
LICENSE_DISTFILES_BitstreamVera=	rust/crates/epaint_default_fonts-0.36.2.crate
LICENSE_DISTFILES_AcadrustMPL20=	rust/crates/acadrust-0.6.5.crate
LICENSE_DISTFILES_CC0-1.0=	storytold-craft-libs-6e7f28518dd1cb57e1624bdc269c3c14316b13ae_GH0.tar.gz

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	Upstream FreeBSD build is tested only on x86_64

BUILD_DEPENDS=	cmake:devel/cmake-core \
		rust>=1.95:lang/rust
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libvulkan.so:graphics/vulkan-loader \
		libwayland-client.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon
RUN_DEPENDS=	xdg-open:devel/xdg-utils \
		zenity:x11/zenity

USES=		cargo desktop-file-utils gl gnome pkgconfig shared-mime-info xorg
USE_GL=		egl
USE_GNOME=	gtk-update-icon-cache
USE_XORG=	x11 xcb xcursor xi xrandr
USE_GITHUB=	yes
GH_ACCOUNT=	storytold
INSTALLS_ICONS=	yes

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILDDEP=	no
CARGO_INSTALL=	no
CARGO_BUILD_ARGS=	-p cadcraft -p cadcraft-cli
CARGO_TEST_ARGS=	-p cadcraft -p cadcraft-cli
CARGO_ENV+=	CARGO_PROFILE_RELEASE_LTO=false \
		CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16 \
		CADCRAFT_BUILD_SHA=1fcf654ea8414ea2ef052ca2b3b77411f2026f78
EGUI_FONTS_DIR=	${CARGO_VENDOR_DIR}/epaint_default_fonts-0.36.2/fonts
WITHOUT_LTO=	yes

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/cadcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/cadcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.cadcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.cadcraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.cadcraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-25/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.cadcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.cadcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/NOTICE \
		${WRKSRC}/ATTRIBUTION.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${DOCSDIR}/

	${MKDIR} ${DOCSDIR}/licenses
	${INSTALL_DATA} ${EGUI_FONTS_DIR}/Hack-Regular.txt \
		${EGUI_FONTS_DIR}/OFL.txt ${EGUI_FONTS_DIR}/UFL.txt \
		${EGUI_FONTS_DIR}/emoji-icon-font-mit-license.txt \
		${FILESDIR}/LICENSE-acadrust.txt \
		${FILESDIR}/THIRD-PARTY-NOTICES.txt ${DOCSDIR}/licenses/
	${INSTALL_DATA} ${WRKSRC_crate_krilla}/vendor/krilla/icc/LICENSE \
		${DOCSDIR}/licenses/LICENSE-ICC-CC0.txt

.include <bsd.port.mk>
