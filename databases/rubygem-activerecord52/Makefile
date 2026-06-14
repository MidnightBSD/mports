PORTNAME=	activerecord
PORTVERSION=	5.2.8.1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	52

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-relational mapping layer for Rails MVC Framework
WWW=		https://rubyonrails.org/ \
		https://github.com/rails/rails/tree/main/activerecord

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activemodel52>=${PORTVERSION}:databases/rubygem-activemodel52 \
		rubygem-activesupport52>=${PORTVERSION}:devel/rubygem-activesupport52 \
		rubygem-arel>=9.0:databases/rubygem-arel

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^5\.2\.

.include <bsd.port.mk>
