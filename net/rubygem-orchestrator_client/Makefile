PORTNAME=	orchestrator_client
PORTVERSION=	0.7.2
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client library for Puppet orchestration services
WWW=		https://github.com/puppetlabs/orchestrator_client-ruby

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-faraday>=2.0:www/rubygem-faraday \
		rubygem-faraday-net_http_persistent>=2.0:www/rubygem-faraday-net_http_persistent

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
