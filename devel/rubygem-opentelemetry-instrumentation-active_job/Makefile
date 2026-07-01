PORTNAME=	opentelemetry-instrumentation-active_job
PORTVERSION=	0.9.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ActiveJob instrumentation for the OpenTelemetry framework
WWW=		https://opentelemetry.io/ \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib/tree/main/instrumentation/active_job \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-opentelemetry-instrumentation-base>=0.23.0<1:devel/rubygem-opentelemetry-instrumentation-base

USES=		gem

RUBY_VER=	3.3

NO_ARCH=	yes

.include <bsd.port.mk>
