PORTNAME=	net-http
PORTVERSION=	0.9.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP client api for Ruby
WWW=		https://github.com/ruby/net-http

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

BUILD_DEPENDS=	rubygem-uri>=0.11.1:net/rubygem-uri
RUN_DEPENDS=	rubygem-uri>=0.11.1:net/rubygem-uri

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
