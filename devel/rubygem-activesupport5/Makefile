PORTNAME=	activesupport
PORTVERSION=	5.1.7
PORTREVISION=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility classes and extension that are required by Rails MVC Framework
WWW=		https://rubyonrails.org/ \
		https://github.com/rails/rails/tree/main/activesupport

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-concurrent-ruby>=1.0.2<2:devel/rubygem-concurrent-ruby \
		rubygem-i18n>=0.7,2<2,2:devel/rubygem-i18n \
		rubygem-minitest>=5.1<6:devel/rubygem-minitest \
		rubygem-tzinfo1>=1.1<2:devel/rubygem-tzinfo1

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	activesupport_project

PORTSCOUT=	limit:^5\.1\.

.include <bsd.port.mk>
