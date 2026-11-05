PORTNAME=	rails
PORTVERSION=	8.1.4.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full-stack web application framework
WWW=		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actioncable81=${PORTVERSION}:www/rubygem-actioncable81 \
		rubygem-actionmailbox81=${PORTVERSION}:mail/rubygem-actionmailbox81 \
		rubygem-actionmailer81=${PORTVERSION}:mail/rubygem-actionmailer81 \
		rubygem-actionpack81=${PORTVERSION}:www/rubygem-actionpack81 \
		rubygem-actiontext81=${PORTVERSION}:textproc/rubygem-actiontext81 \
		rubygem-actionview81=${PORTVERSION}:devel/rubygem-actionview81 \
		rubygem-activejob81=${PORTVERSION}:devel/rubygem-activejob81 \
		rubygem-activemodel81=${PORTVERSION}:databases/rubygem-activemodel81 \
		rubygem-activerecord81=${PORTVERSION}:databases/rubygem-activerecord81 \
		rubygem-activestorage81=${PORTVERSION}:net/rubygem-activestorage81 \
		rubygem-activesupport81=${PORTVERSION}:devel/rubygem-activesupport81 \
		rubygem-bundler>=1.15.0:sysutils/rubygem-bundler \
		rubygem-railties81=${PORTVERSION}:www/rubygem-railties81

USES=		cpe gem
NO_ARCH=	yes

CPE_VENDOR=	rubyonrails
CPE_PRODUCT=	ruby_on_rails

PORTSCOUT=	limit:^8\.1\.

.include <bsd.port.mk>
