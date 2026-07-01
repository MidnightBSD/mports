PORTNAME=	opentelemetry-instrumentation-action_pack
PORTVERSION=	0.14.1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ActionPack instrumentation for the OpenTelemetry framework
WWW=		https://opentelemetry.io/ \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib/tree/main/instrumentation/action_pack \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-opentelemetry-instrumentation-rack>=0.21<1:devel/rubygem-opentelemetry-instrumentation-rack

USES=		gem

RUBY_VER=	3.3

NO_ARCH=	yes

.include <bsd.port.mk>
