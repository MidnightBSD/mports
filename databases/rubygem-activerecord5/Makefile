PORTNAME=	activerecord
PORTVERSION=	5.1.7
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-relational mapping layer for Rails MVC Framework
WWW=		https://rubyonrails.org/ \
		https://github.com/rails/rails/tree/main/activerecord

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-activemodel5>=${PORTVERSION}:databases/rubygem-activemodel5 \
		rubygem-activesupport5>=${PORTVERSION}:devel/rubygem-activesupport5 \
		rubygem-arel8>=8.0,1:databases/rubygem-arel8

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^5\.1\.

.include <bsd.port.mk>
