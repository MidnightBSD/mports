PORTNAME=	actionview
PORTVERSION=	7.2.3
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	72

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple, battle-tested conventions and helpers for building web pages
WWW=		https://github.com/rails/rails/tree/main/actionview \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activesupport72>=${PORTVERSION}<${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}.99:devel/rubygem-activesupport72 \
		rubygem-builder>=3.1<4:devel/rubygem-builder \
		rubygem-cgi>=0:www/rubygem-cgi \
		rubygem-erubi>=1.11<2:www/rubygem-erubi \
		rubygem-rails-dom-testing-rails72>=2.2<3:textproc/rubygem-rails-dom-testing-rails72 \
		rubygem-rails-html-sanitizer>=1.6<2:textproc/rubygem-rails-html-sanitizer

USES=		cpe gem

NO_ARCH=	yes

CPE_VENDOR=	rubyonrails

PORTSCOUT=	limit:^7\.2\.

.include <bsd.port.mk>
