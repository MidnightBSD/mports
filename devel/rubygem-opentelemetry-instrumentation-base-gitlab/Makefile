PORTNAME=	opentelemetry-instrumentation-base
PORTVERSION=	0.25.0
PORTREVISION=	2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Instrumentation Base for the OpenTelemetry framework
WWW=		https://opentelemetry.io/ \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib/tree/main/instrumentation/base \
		https://github.com/open-telemetry/opentelemetry-ruby-contrib

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-opentelemetry-api-gitlab>=1.7<2:devel/rubygem-opentelemetry-api-gitlab \
		rubygem-opentelemetry-common-gitlab>=0.23<0.24:devel/rubygem-opentelemetry-common-gitlab \
		rubygem-opentelemetry-registry-gitlab>=0.4<0.5:devel/rubygem-opentelemetry-registry-gitlab
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem

NO_ARCH=	yes

post-patch:
	${REINPLACE_CMD} -e 's/\["~> 0.21".freeze\]/["~> 0.23".freeze]/' \
		-e 's/\["~> 0.1".freeze\]/["~> 0.4".freeze]/' \
		${WRKSRC}/${PORTNAME}.gemspec

.include <bsd.port.mk>
