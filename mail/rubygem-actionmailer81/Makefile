PORTNAME=	actionmailer
PORTVERSION=	8.1.4.1
CATEGORIES=	mail rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compose, deliver, and test emails in Rails
WWW=		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack81=${PORTVERSION}:www/rubygem-actionpack81 \
		rubygem-actionview81=${PORTVERSION}:devel/rubygem-actionview81 \
		rubygem-activejob81=${PORTVERSION}:devel/rubygem-activejob81 \
		rubygem-activesupport81=${PORTVERSION}:devel/rubygem-activesupport81 \
		rubygem-mail>=2.8.0,2:mail/rubygem-mail \
		rubygem-rails-dom-testing-rails81>=2.2<3:textproc/rubygem-rails-dom-testing-rails81

USES=		gem
NO_ARCH=	yes

PORTSCOUT=	limit:^8\.1\.

.include <bsd.port.mk>
