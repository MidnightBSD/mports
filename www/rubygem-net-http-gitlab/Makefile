PORTNAME=	net-http
PORTVERSION=	0.6.0
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP client api for Ruby
WWW=		https://github.com/ruby/net-http

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/COPYING

RUN_DEPENDS=	rubygem-uri-gitlab>=0:net/rubygem-uri-gitlab

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^0\.6\.

.include <bsd.port.mk>
