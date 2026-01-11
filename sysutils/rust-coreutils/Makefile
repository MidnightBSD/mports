PORTNAME=	rust-coreutils
DISTVERSION=	0.1.0
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform Rust rewrite of the GNU coreutils
WWW=		https://crates.io/crates/coreutils

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libonig.so:devel/oniguruma

USES=		cargo pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	uutils
GH_PROJECT=	coreutils

CARGO_FEATURES=	unix
BINPREFIX=	uu-
PLIST_SUB=	BINPREFIX=${BINPREFIX}

NO_TEST=	yes

post-build:
	${INSTALL_SCRIPT} ${FILESDIR}/symlink-install-helper.sh.in ${CARGO_TARGET_DIR}/symlink-install-helper.sh
	@${REINPLACE_CMD} -e 's|%%GREP%%|${GREP}|g' \
		${CARGO_TARGET_DIR}/symlink-install-helper.sh
	@${REINPLACE_CMD} -e 's|%%CARGO_TARGET_DIR%%|${CARGO_TARGET_DIR}/x86_64-unknown-freebsd/|g' \
		${CARGO_TARGET_DIR}/symlink-install-helper.sh
	@${REINPLACE_CMD} -e 's|%%SED%%|${SED}|g' \
		${CARGO_TARGET_DIR}/symlink-install-helper.sh
	@${REINPLACE_CMD} -e 's|%%TR%%|${TR}|g' \
		${CARGO_TARGET_DIR}/symlink-install-helper.sh
	@${REINPLACE_CMD} -e 's|%%RLN%%|${RLN}|g' \
		${CARGO_TARGET_DIR}/symlink-install-helper.sh
	@${REINPLACE_CMD} -e 's|%%FAKE_DESTDIR%%|${FAKE_DESTDIR}|g' \
		${CARGO_TARGET_DIR}/symlink-install-helper.sh
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${TRUE_PREFIX}|g' \
		${CARGO_TARGET_DIR}/symlink-install-helper.sh
	@${REINPLACE_CMD} -e 's|%%BINPREFIX%%|${BINPREFIX}|g' \
		${CARGO_TARGET_DIR}/symlink-install-helper.sh

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/x86_64-unknown-freebsd/release/coreutils \
		${STAGEDIR}${PREFIX}/bin/${BINPREFIX}coreutils
	${CARGO_TARGET_DIR}/symlink-install-helper.sh

.include <bsd.port.mk>
