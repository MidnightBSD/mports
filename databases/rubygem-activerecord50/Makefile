PORTNAME=	activerecord
PORTVERSION=	5.0.7.2
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	50

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-relational mapping layer for Rails MVC Framework
WWW=		https://rubyonrails.org/ \
		https://github.com/rails/rails/tree/main/activerecord

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=  ${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activemodel50>=${PORTVERSION}:databases/rubygem-activemodel50 \
		rubygem-activesupport50>=${PORTVERSION}:devel/rubygem-activesupport50 \
		rubygem-arel7>=7.0,1<8,1:databases/rubygem-arel7

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^5\.0\.

.include <bsd.port.mk>
