PORTNAME=	marginalia
PORTVERSION=	1.11.1
PORTREVISION=	2
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Attach comments to your ActiveRecord queries
WWW=		https://github.com/basecamp/marginalia

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-actionpack-gitlab>=2.3:www/rubygem-actionpack-gitlab \
		rubygem-activerecord-gitlab>=2.3:databases/rubygem-activerecord-gitlab

USES=		cpe gem
CPE_VENDOR=	${PORTNAME}_project

NO_ARCH=	yes

.include <bsd.port.mk>
