PORTNAME=	activerecord
PORTVERSION=	8.0.5
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	80

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-relational mapping layer for Rails MVC Framework
WWW=		https://github.com/rails/rails/tree/main/activerecord \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activemodel80>=${PORTVERSION}:databases/rubygem-activemodel80 \
		rubygem-activesupport80>=${PORTVERSION}:devel/rubygem-activesupport80 \
		rubygem-timeout>=0.4.0:devel/rubygem-timeout

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^8\.0\.

.include <bsd.port.mk>
