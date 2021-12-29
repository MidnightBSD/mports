# Created by: Timothy Beyer <beyert@cs.ucr.edu>

PORTNAME=	doh-proxy
DISTVERSION=	0.1.19
PORTREVISION=	1
CATEGORIES=	dns

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DNS-over-HTTP server proxy

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cargo
USE_GITHUB=	yes
GH_ACCOUNT=	jedisct1
GH_PROJECT=	rust-doh

PLIST_FILES=	bin/doh-proxy

# make cargo-crates > Makefile.crates
#.include "Makefile.crates"

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/doh-proxy

.include <bsd.port.mk>
