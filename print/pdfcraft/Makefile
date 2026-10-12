PORTNAME=	pdfcraft
DISTVERSIONPREFIX=	v
DISTVERSION=	0.6.0
CATEGORIES=	print
MASTER_SITES=	https://ocrs-models.s3-accelerate.amazonaws.com/:models \
		https://creativecommons.org/licenses/by-sa/4.0/:modellicense
DISTFILES=	text-detection.rten:models \
		text-recognition.rten:models \
		legalcode.txt:modellicense
EXTRACT_ONLY=	${DISTFILES:C/:.*$//:N*.rten:Nlegalcode.txt}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PDF editor and command-line tools
WWW=		https://github.com/storytold/pdfcraft

LICENSE=	mit CC-BY-SA-4.0
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT
LICENSE_FILE_CC-BY-SA-4.0=	${DISTDIR}/legalcode.txt
LICENSE_DISTFILES_mit=	${DISTNAME}${EXTRACT_SUFX}
LICENSE_DISTFILES_CC-BY-SA-4.0=	text-detection.rten text-recognition.rten legalcode.txt

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	Upstream FreeBSD build is tested only on x86_64

BUILD_DEPENDS=	cmake:devel/cmake-core \
		rust>=1.94:lang/rust
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
CARGO_BUILD_ARGS=	-p pdfcraft -p pdfcraft-cli
CARGO_TEST_ARGS=	-p pdfcraft -p pdfcraft-cli
CARGO_ENV+=	CARGO_PROFILE_RELEASE_LTO=false \
		CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16
WITHOUT_LTO=	yes

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/pdfcraft \
		${PREFIX}/bin/
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/pdfcraft-cli \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/mime/packages \
		${PREFIX}/share/metainfo ${PREFIX}/share/icons/hicolor \
		${PREFIX}/share/pdfcraft/models ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.pdfcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/linux/ai.storyteller.pdfcraft.mime.xml \
		${PREFIX}/share/mime/packages/ai.storyteller.pdfcraft.xml
	${SED} -e 's/@VERSION@/${DISTVERSION}/g' \
		-e 's/@DATE@/2026-10-11/g' \
		${WRKSRC}/packaging/linux/ai.storyteller.pdfcraft.metainfo.xml.in \
		> ${PREFIX}/share/metainfo/ai.storyteller.pdfcraft.metainfo.xml
	(cd ${WRKSRC}/assets/app-icon && ${COPYTREE_SHARE} hicolor ${PREFIX}/share/icons/)
	${INSTALL_DATA} ${DISTDIR}/text-detection.rten \
		${DISTDIR}/text-recognition.rten ${PREFIX}/share/pdfcraft/models/
	${INSTALL_DATA} ${DISTDIR}/legalcode.txt \
		${PREFIX}/share/pdfcraft/models/text-detection.rten.LICENCE.txt
	${INSTALL_DATA} ${DISTDIR}/legalcode.txt \
		${PREFIX}/share/pdfcraft/models/text-recognition.rten.LICENCE.txt
	${INSTALL_DATA} ${WRKSRC}/ATTRIBUTION.md \
		${PREFIX}/share/pdfcraft/models/ATTRIBUTION.md
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/NOTICE \
		${WRKSRC}/LICENSE-MIT ${WRKSRC}/LICENSE-APACHE \
		${WRKSRC}/ATTRIBUTION.md ${DOCSDIR}/

.include <bsd.port.mk>
