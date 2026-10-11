PORTNAME=	filmcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.6.0
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video editor and command-line tools
WWW=		https://github.com/storytold/filmcraft

LICENSE=	mit Apache-2.0
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE

BUILD_DEPENDS=	cmake:devel/cmake-core \
		rust>=1.95.0:lang/rust
LIB_DEPENDS=	libasound.so:audio/alsa-lib \
		libfontconfig.so:x11-fonts/fontconfig \
		libvulkan.so:graphics/vulkan-loader \
		libwayland-client.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon
RUN_DEPENDS=	xdg-open:devel/xdg-utils \
		zenity:x11/zenity

USES=		cargo desktop-file-utils gl pkgconfig shared-mime-info xorg
USE_GL=		egl
USE_XORG=	x11 xcb xcursor xi xrandr
USE_GITHUB=	yes
GH_ACCOUNT=	storytold
GH_PROJECT=	filmcraft craft-fonts:fonts
GH_TAGNAME=	v0.6.0 abb83316d96aa59c1cf64784289e378fe9fa5695:fonts

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILD_ARGS=	-p filmcraft -p filmcraft-cli
CARGO_TEST_ARGS=	-p filmcraft -p filmcraft-cli
CARGO_BUILDDEP=	no
CARGO_ENV+=	CRAFT_FONTS_DIR=${WRKSRC_fonts} CRAFT_FONTS_REQUIRED=1 \
		FILMCRAFT_BUILD_SHA=2ff3f5e266838700c292a35aaf762e3d4dcef980
CARGO_INSTALL=	no

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
		-e 's/@DATE@/2026-10-11/g' \
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
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/biz-ud-mincho/OFL.txt \
		${DOCSDIR}/OFL-biz-ud-mincho.txt
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/biz-ud-pgothic/OFL.txt \
		${DOCSDIR}/OFL-biz-ud-pgothic.txt
	${INSTALL_DATA} ${WRKSRC_fonts}/fonts/shippori-mincho/OFL.txt \
		${DOCSDIR}/OFL-shippori-mincho.txt

.include <bsd.port.mk>
