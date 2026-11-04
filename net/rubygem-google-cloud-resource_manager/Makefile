PORTNAME=	google-cloud-resource_manager
PORTVERSION=	0.39.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Official library for Google Cloud Resource Manager
WWW=		https://cloud.google.com/ruby/docs/reference/google-cloud-resource_manager/latest/ \
		https://googleapis.github.io/google-cloud-ruby/docs/ \
		https://github.com/googleapis/google-cloud-ruby/tree/main/google-cloud-resource_manager \
		https://github.com/googleapis/google-cloud-ruby

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-google-apis-cloudresourcemanager_v1>=0.1<1:devel/rubygem-google-apis-cloudresourcemanager_v1 \
		rubygem-google-cloud-core>=1.6<2:net/rubygem-google-cloud-core \
		rubygem-googleauth>=0.16.2<2.0:security/rubygem-googleauth

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
