PORTNAME=	dotenv-linter
DISTVERSIONPREFIX=	v
DISTVERSION=	4.0.0
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linter for .env files. Written in Rust
WWW=		https://dotenv-linter.github.io \
		https://github.com/dotenv-linter/dotenv-linter

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cargo

USE_GITHUB=	yes

PLIST_FILES=	bin/${PORTNAME}

do-install:
	# workaround for error: found a virtual manifest at `xx` instead of a package manifest
	${INSTALL_PROGRAM} \
		${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/${PORTNAME} \
		${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
