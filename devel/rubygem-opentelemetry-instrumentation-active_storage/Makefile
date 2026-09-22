PORTNAME=	opentelemetry-instrumentation-active_storage
PORTVERSION=	0.5.1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ActiveStorage instrumentation for the OpenTelemetry framework
WWW=		https://opentelemetry.io/ \
		https://github.com/open-telemetry/opentelemetry-ruby \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib/tree/main/instrumentation/active_storage

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-opentelemetry-instrumentation-active_support>=0.10<1:devel/rubygem-opentelemetry-instrumentation-active_support

USES=		gem

RUBY_VER=	3.3

NO_ARCH=	yes

.include <bsd.port.mk>
