PORTNAME=	opentelemetry-registry
PORTVERSION=	0.5.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Registry for the OpenTelemetry Instrumentation libraries
WWW=		https://opentelemetry.io/ \
		https://github.com/open-telemetry/opentelemetry-ruby/tree/main/registry \
		https://github.com/open-telemetry/opentelemetry-ruby

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-opentelemetry-api>=1.1<2:devel/rubygem-opentelemetry-api

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
