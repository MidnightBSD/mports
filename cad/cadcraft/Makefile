PORTNAME=	cadcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.6.2
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Computer-aided design and drafting application
WWW=		https://github.com/storytold/cadcraft

LICENSE=	mit Apache-2.0
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE

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
		CADCRAFT_BUILD_SHA=00c7613f1af3c73f7157fa91d9fe2635c6f23c06
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
		-e 's/@DATE@/2026-10-12/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.cadcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.cadcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/NOTICE \
		${WRKSRC}/ATTRIBUTION.md ${WRKSRC}/LICENSE-MIT \
		${WRKSRC}/LICENSE-APACHE ${DOCSDIR}/

.include <bsd.port.mk>
