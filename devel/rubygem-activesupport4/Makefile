PORTNAME=	activesupport
PORTVERSION=	4.2.11.3
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility classes and extension that are required by Rails MVC Framework
WWW=		https://rubyonrails.org/ \
		https://github.com/rails/rails/tree/main/activesupport

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-i18n>=0.7,2:devel/rubygem-i18n \
		rubygem-minitest>=5.1<6:devel/rubygem-minitest \
		rubygem-thread_safe>=0.3.4<1:devel/rubygem-thread_safe \
		rubygem-tzinfo1>=1.1<2:devel/rubygem-tzinfo1

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	activesupport_project

PORTSCOUT=	limit:^4\.2\.

.include <bsd.port.mk>
