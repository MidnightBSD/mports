PORTNAME=	activemodel
PORTVERSION=	5.0.7.2
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	50

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolkit for building modeling frameworks
WWW=		https://rubyonrails.org/ \
		https://github.com/rails/rails/tree/main/activemodel

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	rubygem-activesupport50>=${PORTVERSION}:devel/rubygem-activesupport50
RUN_DEPENDS=	rubygem-activesupport50>=${PORTVERSION}:devel/rubygem-activesupport50

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^5\.0\.

.include <bsd.port.mk>
