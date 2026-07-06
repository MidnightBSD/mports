PORTNAME=	rb_sys
PORTVERSION=	0.9.126
CATEGORIES=	lang rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helpers for compiling Rust extensions for ruby
WWW=		https://oxidize-rb.github.io/rb-sys/ \
		https://github.com/oxidize-rb/rb-sys

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-json>=2:devel/rubygem-json \
		rubygem-rake-compiler-dock=1.11.0:devel/rubygem-rake-compiler-dock

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/rb-sys-dock

.include <bsd.port.mk>
