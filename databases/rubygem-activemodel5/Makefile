PORTNAME=	activemodel
PORTVERSION=	5.1.7
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolkit for building modeling frameworks
WWW=		https://rubyonrails.org/ \
		https://github.com/rails/rails/tree/main/activemodel

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-activesupport5>=${PORTVERSION}:devel/rubygem-activesupport5

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^5\.1\.

.include <bsd.port.mk>
