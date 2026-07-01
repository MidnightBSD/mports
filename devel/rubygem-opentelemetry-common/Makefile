PORTNAME=	opentelemetry-common
PORTVERSION=	0.24.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common helpers for OpenTelemetry
WWW=		https://opentelemetry.io/ \
		https://github.com/open-telemetry/opentelemetry-ruby/tree/main/common \
		https://github.com/open-telemetry/opentelemetry-ruby

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-opentelemetry-api>=1.0<2:devel/rubygem-opentelemetry-api

USES=		gem

RUBY_VER=	3.3

NO_ARCH=	yes

.include <bsd.port.mk>
