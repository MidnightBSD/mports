PORTNAME=	activerecord
PORTVERSION=	8.1.3
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-relational mapping layer for Rails MVC Framework
WWW=		https://github.com/rails/rails/tree/main/activerecord \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activemodel81=${PORTVERSION}:databases/rubygem-activemodel81 \
		rubygem-activesupport81=${PORTVERSION}:devel/rubygem-activesupport81 \
		rubygem-timeout>=0.4.0:devel/rubygem-timeout

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^8\.1\.

.include <bsd.port.mk>
