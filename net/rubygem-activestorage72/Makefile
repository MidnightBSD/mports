PORTNAME=	activestorage
PORTVERSION=	7.2.2.2
CATEGORIES=	net rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	72

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Attach cloud and local files in Rails applications
WWW=		https://github.com/rails/rails/tree/main/activestorage \
		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack72>=${PORTVERSION}<${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}.99:www/rubygem-actionpack72 \
		rubygem-activejob72>=${PORTVERSION}<${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}.99:devel/rubygem-activejob72 \
		rubygem-activerecord72>=${PORTVERSION}<${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}.99:databases/rubygem-activerecord72 \
		rubygem-activesupport72>=${PORTVERSION}<${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}.99:devel/rubygem-activesupport72 \
		rubygem-marcel>=1.0<2:devel/rubygem-marcel

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^7\.2\.

.include <bsd.port.mk>
