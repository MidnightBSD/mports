PORTNAME=	rustls-ffi
DISTVERSIONPREFIX=	v
DISTVERSION=	0.13.0
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FFI bindings for the rustls TLS library
WWW=		https://github.com/rustls/rustls-ffi

LICENSE=	Apache-2.0 iscl mit
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_iscl=	${WRKSRC}/LICENSE-ISC
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

BUILD_DEPENDS=	cargo-cbuild:devel/cargo-c

USES=		cargo
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	rustls

do-build:
	@${CARGO_CARGO_RUN} cbuild --verbose --verbose ${CARGO_BUILD_ARGS}

do-install:
	@${CARGO_CARGO_RUN} cinstall --verbose --verbose \
	    --destdir "${FAKE_DESTDIR}" \
	    --prefix "${TRUE_PREFIX}" \
	    ${CARGO_INSTALL_ARGS}

.include <bsd.port.mk>
