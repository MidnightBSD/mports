PORTNAME=	aws-sdk-cloudformation
PORTVERSION=	1.134.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Official AWS Ruby gem for AWS CloudFormation
WWW=		https://github.com/aws/aws-sdk-ruby/tree/version-3/gems/aws-sdk-cloudformation

LICENSE=	Apache-2.0

RUN_DEPENDS=	rubygem-aws-sdk-core-gitlab>=3.225.0<4:devel/rubygem-aws-sdk-core-gitlab \
		rubygem-aws-sigv4>=1.5<2:devel/rubygem-aws-sigv4

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
