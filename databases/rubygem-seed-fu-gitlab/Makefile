PORTNAME=	seed-fu
PORTVERSION=	2.3.9
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to maintain seed data
WWW=		https://github.com/mbleigh/seed-fu

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-activerecord-gitlab>=3.1:databases/rubygem-activerecord-gitlab \
		rubygem-activesupport-gitlab>=3.1:devel/rubygem-activesupport-gitlab

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
