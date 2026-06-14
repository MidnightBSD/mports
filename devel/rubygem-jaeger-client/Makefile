PORTNAME=	jaeger-client
PORTVERSION=	1.1.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenTracing Tracer implementation for Jaeger in Ruby
WWW=		https://github.com/salemove/jaeger-client-ruby

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-opentracing>=0.3:devel/rubygem-opentracing \
		rubygem-thrift>=0:devel/rubygem-thrift

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
