PORTNAME=	google-cloud-logging-v2
PORTVERSION=	1.4.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby Client for the Cloud Logging V2 API
WWW=		https://cloud.google.com/ruby/docs/reference/google-cloud-logging-v2/latest/ \
		https://googleapis.github.io/google-cloud-ruby/docs/ \
		https://github.com/googleapis/google-cloud-ruby/tree/main/google-cloud-logging-v2 \
		https://github.com/googleapis/google-cloud-ruby

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-gapic-common>=1.2<2:devel/rubygem-gapic-common \
		rubygem-google-cloud-errors>=1.0<2:net/rubygem-google-cloud-errors

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
