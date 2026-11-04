PORTNAME=	actionmailbox
PORTVERSION=	8.1.4.1
CATEGORIES=	mail rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Receive and process incoming emails in Rails applications
WWW=		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack81=${PORTVERSION}:www/rubygem-actionpack81 \
		rubygem-activejob81=${PORTVERSION}:devel/rubygem-activejob81 \
		rubygem-activerecord81=${PORTVERSION}:databases/rubygem-activerecord81 \
		rubygem-activestorage81=${PORTVERSION}:net/rubygem-activestorage81 \
		rubygem-activesupport81=${PORTVERSION}:devel/rubygem-activesupport81 \
		rubygem-mail>=2.8.0,2:mail/rubygem-mail

USES=		gem
NO_ARCH=	yes

PORTSCOUT=	limit:^8\.1\.

.include <bsd.port.mk>
