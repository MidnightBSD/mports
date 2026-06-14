PORTNAME=	activerecord
PORTVERSION=	6.0.6.1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	60

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-relational mapping layer for Rails MVC Framework
WWW=		https://github.com/rails/rails/tree/main/activerecord \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activemodel60>=${PORTVERSION}<${PORTVERSION}_99:databases/rubygem-activemodel60 \
		rubygem-activesupport60>=${PORTVERSION}<${PORTVERSION}_99:devel/rubygem-activesupport60

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^6\.0\.

.include <bsd.port.mk>
