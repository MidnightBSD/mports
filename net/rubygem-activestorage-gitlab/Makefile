PORTNAME=	activestorage
PORTVERSION=	${RAILS_VERSION}
CATEGORIES=	net rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Attach cloud and local files in Rails applications
WWW=		https://github.com/rails/rails/tree/main/activestorage \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:www/rubygem-actionpack-gitlab \
		rubygem-activejob-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-activejob-gitlab \
		rubygem-activerecord-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:databases/rubygem-activerecord-gitlab \
		rubygem-activesupport-gitlab>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-activesupport-gitlab \
		rubygem-marcel-gitlab>=1.0<2:devel/rubygem-marcel-gitlab

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^7\.2\.

.include "${.CURDIR}/../../www/gitlab/Makefile.common"
.include <bsd.port.mk>
