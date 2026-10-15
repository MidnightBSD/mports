PORTNAME=	wordcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.6.1
CATEGORIES=	editors

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Word processor and document conversion tools
WWW=		https://github.com/storytold/wordcraft

LICENSE=	mit bsd3 OFL11
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_bsd3=	${WRKSRC}/assets/hyphenation/pt.pat
LICENSE_FILE_OFL11=	${WRKSRC}/assets/fonts/OFL-Inter.txt

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
INSTALLS_ICONS=	yes

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILDDEP=	no
CARGO_INSTALL=	no
CARGO_BUILD_ARGS=	-p wordcraft -p wordcraft-cli
CARGO_TEST_ARGS=	-p wordcraft -p wordcraft-cli
CARGO_ENV+=	CARGO_PROFILE_RELEASE_LTO=false \
		CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16
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
		-e 's/@DATE@/2026-10-12/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.wordcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.wordcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/NOTICE \
		${WRKSRC}/ATTRIBUTION.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${WRKSRC}/assets/hyphenation/pt.pat \
		${WRKSRC}/assets/hyphenation/pl.pat \
		${WRKSRC}/assets/fonts/OFL-*.txt ${DOCSDIR}/

.include <bsd.port.mk>
