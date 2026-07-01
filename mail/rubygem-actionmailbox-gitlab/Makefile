PORTNAME=	actionmailbox
PORTVERSION=	${RAILS_VERSION}
CATEGORIES=	mail rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Receive and process incoming emails in Rails applications
WWW=		https://github.com/rails/rails/tree/main/actionmailbox \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/mit-LICENSE

RUN_DEPENDS=	rubygem-actionpack-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:www/rubygem-actionpack-gitlab \
		rubygem-activejob-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-activejob-gitlab \
		rubygem-activerecord-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:databases/rubygem-activerecord-gitlab \
		rubygem-activestorage-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:net/rubygem-activestorage-gitlab \
		rubygem-activesupport-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-activesupport-gitlab \
		rubygem-mail>=2.8.0,2:mail/rubygem-mail

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^7\.2\.

.include "${.CURDIR}/../../www/gitlab/Makefile.common"
.include <bsd.port.mk>
