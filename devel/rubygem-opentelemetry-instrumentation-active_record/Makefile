PORTNAME=	opentelemetry-instrumentation-active_record
PORTVERSION=	0.10.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ActiveRecord instrumentation for the OpenTelemetry framework
WWW=		https://opentelemetry.io/ \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib/tree/main/instrumentation/active_record \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-opentelemetry-instrumentation-base>=0.23.0<1:devel/rubygem-opentelemetry-instrumentation-base

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
