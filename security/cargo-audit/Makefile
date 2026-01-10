PORTNAME=	cargo-audit
DISTVERSIONPREFIX=	${PORTNAME}/v
DISTVERSION=	0.22.0
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audit Cargo.lock for crates with security vulnerabilities
WWW=		https://rustsec.org/

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/${PORTNAME}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/${PORTNAME}/LICENSE-MIT

# ca_root_nss must be installed until
# https://github.com/rustsec/rustsec/issues/1137 is fixed
RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss

USES=		cargo localbase ssl
USE_GITHUB=	yes
GH_ACCOUNT=	RustSec
GH_PROJECT=	rustsec

CARGO_CARGOTOML=	${WRKSRC}/${PORTNAME}/Cargo.toml
CARGO_INSTALL_PATH=	${PORTNAME}

NO_TEST=	yes
PORTSCOUT=	limit:^0\.

PLIST_FILES=	bin/cargo-audit

.include <bsd.port.mk>
