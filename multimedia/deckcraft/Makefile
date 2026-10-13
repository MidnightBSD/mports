PORTNAME=	deckcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.6.1
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Presentation editor and command-line tools
WWW=		https://github.com/storytold/deckcraft

LICENSE=	mit OFL11 ArtCraftBrand
LICENSE_COMB=	multi
LICENSE_NAME_ArtCraftBrand=	ArtCraft Brand Terms
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_OFL11=	${WRKSRC_fonts}/fonts/inter/OFL.txt
LICENSE_FILE_ArtCraftBrand=	${WRKSRC}/docs/brand/LICENSE-brand.txt
LICENSE_PERMS_ArtCraftBrand=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept

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
GH_PROJECT=	deckcraft craft-fonts:fonts
GH_TAGNAME=	v0.6.1 43913056ce82a3fdad0ef69f6b88d1dc922a8104:fonts
INSTALLS_ICONS=	yes

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILDDEP=	no
CARGO_INSTALL=	no
CARGO_BUILD_ARGS=	-p deckcraft -p deckcraft-cli
CARGO_TEST_ARGS=	-p deckcraft -p deckcraft-cli
CARGO_ENV+=	CRAFT_FONTS_DIR=${WRKSRC_fonts} CRAFT_FONTS_REQUIRED=1 \
		CARGO_PROFILE_RELEASE_LTO=false \
		CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16 \
		DECKCRAFT_BUILD_SHA=688c7ef592c901ca4541c25e210c1b302e4dc066
WITHOUT_LTO=	yes

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/deckcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/deckcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.deckcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.deckcraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.deckcraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-12/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.deckcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.deckcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/NOTICE \
		${WRKSRC}/ATTRIBUTION.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/docs/brand/LICENSE-brand.txt \
		${DOCSDIR}/LICENSE-brand.txt
	${INSTALL_DATA} ${WRKSRC_fonts}/ATTRIBUTION.md \
		${DOCSDIR}/ATTRIBUTION-craft-fonts.md
	for f in ${WRKSRC_fonts}/fonts/*/OFL.txt; do \
		${INSTALL_DATA} "$$f" ${DOCSDIR}/OFL-$$(basename $$(dirname "$$f")).txt; \
	done

.include <bsd.port.mk>
