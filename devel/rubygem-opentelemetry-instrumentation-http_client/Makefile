PORTNAME=	opentelemetry-instrumentation-http_client
PORTVERSION=	0.25.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HttpClient instrumentation for the OpenTelemetry framework
WWW=		https://opentelemetry.io/ \
		https://github.com/open-telemetry/opentelemetry-ruby \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib/tree/main/instrumentation/http_client

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-opentelemetry-instrumentation-base>=0.23<1:devel/rubygem-opentelemetry-instrumentation-base

USES=		gem

RUBY_VER=	3.3

NO_ARCH=	yes

.include <bsd.port.mk>
