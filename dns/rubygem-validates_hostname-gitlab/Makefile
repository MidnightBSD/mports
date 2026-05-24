PORTNAME=	validates_hostname
PORTVERSION=	1.0.13
CATEGORIES=	dns rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extension to ActiveRecord::Base for validating hostnames
WWW=		https://github.com/KimNorgaard/validates_hostname

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/mit-LICENSE

RUN_DEPENDS=	rubygem-activerecord-gitlab>=3.0:databases/rubygem-activerecord-gitlab \
		rubygem-activesupport-gitlab>=3.0:devel/rubygem-activesupport-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
