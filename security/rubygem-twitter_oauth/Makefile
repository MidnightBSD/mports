PORTNAME=	twitter_oauth
PORTVERSION=	0.4.94
CATEGORIES=	security rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Twitter OAuth REST API client library for Ruby
WWW=		https://github.com/moomerman/twitter_oauth

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-json>=1.8.0:devel/rubygem-json \
		rubygem-mime-types>=1.16:misc/rubygem-mime-types \
		rubygem-oauth>=0.4.7:net/rubygem-oauth

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
