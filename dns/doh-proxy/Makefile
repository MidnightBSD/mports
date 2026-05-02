PORTNAME=	doh-proxy
DISTVERSION=	0.9.15
PORTREVISION=	4
CATEGORIES=	dns
MASTER_SITES=	CRATESIO
DISTFILES=	${CARGO_DIST_SUBDIR}/${DISTNAME}${CARGO_CRATE_EXT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DNS-over-HTTP server proxy
WWW=		https://github.com/DNSCrypt/doh-server

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_i386=	fails to build
USES=		cargo

USE_RC_SUBR=	doh-proxy

PLIST_FILES=	bin/doh-proxy

# make cargo-crates > Makefile.crates

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/doh-proxy

.include <bsd.port.mk>
