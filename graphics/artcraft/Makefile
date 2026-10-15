PORTNAME=	artcraft
DISTVERSIONPREFIX=	artcraft-v
DISTVERSION=	0.41.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Desktop application for AI image and video creation
WWW=		https://github.com/storytold/artcraft

LICENSE=	ArtCraft
LICENSE_NAME=	ArtCraft Fair Source License
LICENSE_FILE=	${WRKSRC}/LICENSE.md
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	Frontend Rollup binary is unavailable for FreeBSD i386

FETCH_DEPENDS=	${LOCALBASE}/bin/npm:www/npm-node24 \
		git:devel/git
BUILD_DEPENDS=	${LOCALBASE}/bin/npm:www/npm-node24 \
		${LOCALBASE}/bin/rustc:lang/rust
LIB_DEPENDS=	libwebkit2gtk-4.1.so:www/webkit2-gtk@41 \
		libsoup-3.0.so:devel/libsoup3
RUN_DEPENDS=	xdg-open:devel/xdg-utils

USES=		cargo desktop-file-utils gnome nodejs:24,build pkgconfig
USE_GNOME=	gtk30 gtk-update-icon-cache
USE_GITHUB=	yes
GH_ACCOUNT=	storytold
INSTALLS_ICONS=	yes

MAKE_JOBS_NUMBER_LIMIT=	4
CARGO_BUILDDEP=	no
WITHOUT_LTO=	yes
CARGO_BUILD_ARGS=	-p artcraft --bin artcraft --features tauri/custom-protocol
CARGO_TEST_ARGS=	-p artcraft
CARGO_INSTALL=	no
CARGO_ENV+=	SQLX_OFFLINE=true \
		CARGO_PROFILE_RELEASE_LTO=false \
		CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16

post-fetch:
	@if [ ! -f ${DISTDIR}/${PORTNAME}-npm-cache/.fetched-${DISTVERSION} ]; then \
		${MKDIR} ${WRKDIR}/npm-fetch && \
		${TAR} -xzf ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} \
			-C ${WRKDIR}/npm-fetch --strip-components 1 \
			'${GH_PROJECT}-${GH_TAGNAME}/frontend' && \
		(cd ${WRKDIR}/npm-fetch/frontend && \
			${SETENV} HOME=${WRKDIR} GIT_CONFIG_COUNT=1 \
			GIT_CONFIG_KEY_0=url.https://github.com/.insteadOf \
			GIT_CONFIG_VALUE_0=ssh://git@github.com/ \
			npm ci --ignore-scripts --no-audit --no-fund \
			--cache=${DISTDIR}/${PORTNAME}-npm-cache) && \
		${TOUCH} ${DISTDIR}/${PORTNAME}-npm-cache/.fetched-${DISTVERSION}; \
	fi

pre-build:
	(cd ${WRKSRC}/frontend && \
		${SETENV} HOME=${WRKDIR} GIT_CONFIG_COUNT=1 \
		GIT_CONFIG_KEY_0=url.https://github.com/.insteadOf \
		GIT_CONFIG_VALUE_0=ssh://git@github.com/ \
		npm ci --offline --ignore-scripts \
		--no-audit --no-fund --cache=${DISTDIR}/${PORTNAME}-npm-cache && \
		${SETENV} HOME=${WRKDIR} npm run build --workspace artcraft)

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/artcraft \
		${PREFIX}/bin/
	${MKDIR} ${PREFIX}/share/applications \
		${PREFIX}/share/icons/hicolor/512x512/apps ${DOCSDIR}
	${INSTALL_DATA} ${FILESDIR}/artcraft.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/crates/desktop/artcraft/icons/icon.png \
		${PREFIX}/share/icons/hicolor/512x512/apps/artcraft.png
	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKSRC}/LICENSE.md ${DOCSDIR}/

.include <bsd.port.mk>
