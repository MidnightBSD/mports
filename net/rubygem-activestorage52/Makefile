PORTNAME=	activestorage
PORTVERSION=	5.2.8.1
PORTREVISION=	1
CATEGORIES=	net rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	52

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Attach cloud and local files in Rails applications
WWW=		https://rubyonrails.org/ \
		https://github.com/rails/rails/tree/main/activestorage

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack52>=${PORTVERSION}:www/rubygem-actionpack52 \
		rubygem-activerecord52>=${PORTVERSION}:databases/rubygem-activerecord52 \
		rubygem-marcel>=1.0.0<2:devel/rubygem-marcel

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^5\.2\.

.include <bsd.port.mk>
