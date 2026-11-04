PORTNAME=	action_text-trix
PORTVERSION=	2.1.19
CATEGORIES=	www rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Trix editor assets for Rails Action Text
WWW=		https://rubyonrails.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-railties81>=8.1.4.1:www/rubygem-railties81

USES=		gem
NO_ARCH=	yes

PORTSCOUT=	limit:^2\.1\.

.include <bsd.port.mk>
