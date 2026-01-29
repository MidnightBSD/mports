PORTNAME=	google-api-client
PORTVERSION=	0.53.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client for accessing Google APIs
WWW=		https://github.com/googleapis/google-api-ruby-client

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-google-apis-core>=0.1<1:devel/rubygem-google-apis-core \
		rubygem-google-apis-generator>=0.1<1:devel/rubygem-google-apis-generator

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
