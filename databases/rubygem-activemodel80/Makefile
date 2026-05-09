PORTNAME=	activemodel
PORTVERSION=	8.0.5
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	80

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolkit for building modeling frameworks like Active Record
WWW=		https://github.com/rails/rails/tree/main/activemodel \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	rubygem-activesupport80>=${PORTVERSION}:devel/rubygem-activesupport80
RUN_DEPENDS=	rubygem-activesupport80>=${PORTVERSION}:devel/rubygem-activesupport80

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^8\.0\.

.include <bsd.port.mk>
