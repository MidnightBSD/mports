PORTNAME=	actiontext
PORTVERSION=	8.1.4.1
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Edit and display rich text in Rails applications
WWW=		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack81=${PORTVERSION}:www/rubygem-actionpack81 \
		rubygem-action_text-trix81>=2.1.15<2.2:www/rubygem-action_text-trix81 \
		rubygem-activerecord81=${PORTVERSION}:databases/rubygem-activerecord81 \
		rubygem-activestorage81=${PORTVERSION}:net/rubygem-activestorage81 \
		rubygem-activesupport81=${PORTVERSION}:devel/rubygem-activesupport81 \
		rubygem-globalid-rails81>=0.6.0:databases/rubygem-globalid-rails81 \
		rubygem-nokogiri>=1.8.5:textproc/rubygem-nokogiri

USES=		gem
NO_ARCH=	yes

PORTSCOUT=	limit:^8\.1\.

.include <bsd.port.mk>
