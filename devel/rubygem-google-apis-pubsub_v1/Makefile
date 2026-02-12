PORTNAME=	google-apis-pubsub_v1
PORTVERSION=	0.64.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple REST client for Cloud Pub/Sub API V1
WWW=		https://github.com/googleapis/google-api-ruby-client/tree/main/generated/google-apis-pubsub_v1 \
		https://github.com/googleapis/google-api-ruby-client

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	rubygem-google-apis-core>=0.15.0<2.0:devel/rubygem-google-apis-core
RUN_DEPENDS=	rubygem-google-apis-core>=0.15.0<2.0:devel/rubygem-google-apis-core

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
